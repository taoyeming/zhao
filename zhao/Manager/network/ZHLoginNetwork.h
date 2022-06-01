//
//  ZHLoginNetwork.h
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHBaseNetwork.h"

@interface ZHLoginModel : NSObject

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, strong, nullable) NSString *phone;
@property (nonatomic, strong, nullable) NSString *nickName;
@property (nonatomic, strong, nullable) NSString *account;
@property (nonatomic, strong, nullable) NSString *header;
@property (nonatomic, strong, nullable) NSString *cardNo;
@property (nonatomic, assign) NSInteger accountStatus;
@property (nonatomic, strong, nullable) NSDate *createTime;
@property (nonatomic, strong, nullable) NSDate *updateTime;
@property (nonatomic, strong, nullable) NSString *token;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ZHLoginNetwork : ZHBaseNetwork

- (void)getCodeWithPhone:(NSString *)phone
                  succed:(void(^)(NSDictionary *dict, NSString *msg))succed
                  failed:(void(^)(NSString *msg))failed;

- (void)loginWithPhone:(NSString *)phone
                  code:(NSString *)code
                succed:(void(^)(ZHLoginModel *model, NSString *msg))succed
                failed:(void(^)(NSString *msg))failed;

- (void)logoutWithAuthorization:(NSString *)authorization
                         succed:(void(^)(NSDictionary *dict, NSString *msg))succed
                         failed:(void(^)(NSString *msg))failed;

@end

NS_ASSUME_NONNULL_END
