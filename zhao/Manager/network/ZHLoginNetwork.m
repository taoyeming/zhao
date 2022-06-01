//
//  ZHLoginNetwork.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHLoginNetwork.h"
#import <YYModel/YYModel.h>

@implementation ZHLoginNetwork

- (void)getCodeWithPhone:(NSString *)phone succed:(void (^)(NSDictionary * _Nonnull, NSString * _Nonnull))succed failed:(void (^)(NSString * _Nonnull))failed {
    
    succed(@{}, @"成功");
    return;
    
    [super requesWithPath:@"/api/oauth2/app/sms/sendCode"
                   method:ZHBaseNetworkMethodGet
                parameter:@{@"phone" : phone ?: @""}
                   succed:succed
                   failed:failed];
}

- (void)loginWithPhone:(NSString *)phone code:(NSString *)code succed:(void (^)(ZHLoginModel * _Nonnull, NSString * _Nonnull))succed failed:(void (^)(NSString * _Nonnull))failed {
    
    NSDictionary *dic = @{
        @"data" : @{
            @"id" : @(12),
            @"phone" : phone ?: @"",
            @"nickName" : @"testNickName",
            @"account" : @"iLve",
            @"header" : @"123123",
            @"cardNo" : @"42323123123123121231",
            @"status" : @(1),
            @"createTime" : @"2022-05-27 12:12:12",
            @"updateTime" : @"2022-05-27 12:12:12",
        },
        @"token" : @"123123",
    };
    ZHLoginModel *model = [ZHLoginModel yy_modelWithDictionary:dic[@"data"]];
    model.token = dic[@"token"];
    if(succed) succed(model, @"成功");
    
//    failed(@"fuck u");
    
    return;
    
    [super requesWithPath:@"/api/oauth2/app/loginAndRegister"
                   method:ZHBaseNetworkMethodPost
                parameter:@{@"appPhone" : phone ?: @"", @"code" : code ?: @""}
                   succed:^(NSDictionary * _Nonnull obj, NSString * _Nonnull msg) {
        ZHLoginModel *model = [ZHLoginModel yy_modelWithDictionary:obj[@"data"]];
        model.token = obj[@"token"];
        if(succed) succed(model, msg);
    } failed:failed];
}

- (void)logoutWithAuthorization:(NSString *)authorization
                         succed:(void(^)(NSDictionary *dict, NSString *msg))succed
                         failed:(void(^)(NSString *msg))failed {
    if(authorization) {
        authorization = [NSString stringWithFormat:@"bearer %@", authorization];
    }
    [super requesWithPath:@"/api/oauth2/member/loginOut"
                   method:ZHBaseNetworkMethodGet
                parameter:@{@"Authorization" : authorization ?: @""}
                   succed:succed
                   failed:failed];
}

@end

@implementation ZHLoginModel

+ (NSDictionary *)modelCustonPropertyMapper {
    return @{
        @"_id" : @"id",
        @"accountStatus" : @"status",
    };
}

@end
