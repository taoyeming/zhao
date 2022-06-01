//
//  ZHBaseNetwork.h
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ZHBaseNetworkMethodGet,
    ZHBaseNetworkMethodPost,
} ZHBaseNetworkMethod;

@interface ZHBaseNetwork : NSObject

- (void)requesWithPath:(NSString *)path
                method:(ZHBaseNetworkMethod)method
             parameter:(NSDictionary *)parameter
                succed:(void(^)(NSDictionary *obj, NSString *msg))succed
                failed:(void(^)(NSString *msg))failed;

@end

NS_ASSUME_NONNULL_END
