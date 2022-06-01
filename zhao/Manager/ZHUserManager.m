//
//  ZHUserManager.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHUserManager.h"
#import "ZHLoginNetwork.h"

@interface ZHUserManager()

@property (nonatomic, strong) ZHLoginNetwork *loginNetwork;

@property (nonatomic, strong) ZHLoginModel *loginModel;

@end

@implementation ZHUserManager

+ (instancetype)shared {
    static id _shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [self new];
    });
    return _shared;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        [self readFromUserdefault];
    }
    return self;
}

- (void)loginWithPhone:(NSString *)phone
                  code:(NSString *)code
                succed:(void(^)(NSString *msg))succed
                failed:(void(^)(NSString *msg))failed {
    [self.loginNetwork loginWithPhone:phone
                                 code:code
                               succed:^(ZHLoginModel * _Nonnull model, NSString * _Nonnull msg) {
        self.loginModel = model;
        [self saveToUserdefault];
    } failed:^(NSString * _Nonnull msg) {
        failed(msg);
    }];
}

- (void)logout {
    [self.loginNetwork logoutWithAuthorization:self.token
                                        succed:^(NSDictionary * _Nonnull dict, NSString * _Nonnull msg) {
    } failed:^(NSString * _Nonnull msg) {
    }];
    self.token = nil;
    [self saveToUserdefault];
    self.logined = NO;
}

- (ZHLoginNetwork *)loginNetwork {
    if(!_loginNetwork) {
        _loginNetwork = [ZHLoginNetwork new];
    }
    return _loginNetwork;
}

#define USER_INFO_KEY @"com.zhao.user"

- (void)readFromUserdefault {
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:USER_INFO_KEY];
    if(![dic isKindOfClass:[NSDictionary class]]) return;
    ZHLoginModel *model = [ZHLoginModel yy_modelWithDictionary:dic];
    self.loginModel = model;
}

- (void)saveToUserdefault {
    NSDictionary *dic = [self.loginModel yy_modelToJSONObject];
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:USER_INFO_KEY];
}

- (void)deleteUserdefault {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_INFO_KEY];
}

- (void)setLoginModel:(ZHLoginModel *)loginModel {
    self._id = loginModel._id;
    self.phone = loginModel.phone;
    self.nickName = loginModel.nickName;
    self.account = loginModel.account;
    self.header = loginModel.header;
    self.cardNo = loginModel.cardNo;
    self.accountStatus = loginModel.accountStatus;
    self.createTime = loginModel.createTime;
    self.updateTime = loginModel.updateTime;
    self.token = loginModel.token;
    self.logined = self.token.length > 0;
    self.savedUser = YES;
    _loginModel = loginModel;
}

- (UIImage *)headerImage {
    if(!_headerImage) {
        _headerImage = [UIImage imageNamed:@"defaultIcon"];
    }
    return _headerImage;
}

@end
