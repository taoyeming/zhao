//
//  ZHBaseNetwork.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHBaseNetwork.h"
#import "ZHUserManager.h"

@interface ZHBaseNetwork()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation ZHBaseNetwork

- (NSString *)host {
    return @"http://ilive.vipgz1.91tunnel.com";
}

- (NSDictionary *)header {
    NSString *token = ZHUserManager.shared.token;
    if(token) {
        return @{@"token" : token};
    }
    return @{};
}

- (void)requesWithPath:(NSString *)path
                method:(ZHBaseNetworkMethod)method
             parameter:(NSDictionary *)parameter
                succed:(void(^)(NSDictionary *obj, NSString *msg))succed
                failed:(void(^)(NSString *msg))failed {
    NSString *fullPath = [NSString stringWithFormat:@"%@%@", self.host, path];
    void (^succedBlock)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        if(![dic isKindOfClass:[NSDictionary class]]) {
            if(failed) failed(@"未知错误");
            return;
        }
        NSString *code = dic[@"code"];
        NSString *msg = dic[@"msg"];
        if(code.intValue != 200) {
            if(msg.length < 1) msg = @"未知错误";
            if(failed) failed(msg);
            return;
        }
        if(succed) {
            succed(responseObject, msg);
        }
    };
    
    void (^failedBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(!failed) return;
        failed(error.localizedDescription);
    };
    
    switch (method) {
        case ZHBaseNetworkMethodGet: {
            [self.manager GET:fullPath
                   parameters:parameter
                      headers:self.header
                     progress:nil
                      success:succedBlock
                      failure:failedBlock];
            break;
        }
        case ZHBaseNetworkMethodPost: {
            [self.manager POST:fullPath
                    parameters:parameter
                       headers:self.header
                      progress:nil
                       success:succedBlock
                       failure:failedBlock];
            break;
        }
    }
}

- (AFHTTPSessionManager *)manager {
    if(!_manager) {
        _manager = [[AFHTTPSessionManager alloc] init];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _manager;
}

@end
