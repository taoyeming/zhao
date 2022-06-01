//
//  ZHUserManager.h
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHUserManager : NSObject

+ (instancetype)shared;

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, strong, nullable) NSString *phone;
@property (nonatomic, strong, nullable) NSString *nickName;
@property (nonatomic, strong, nullable) NSString *account;
@property (nonatomic, strong, nullable) NSString *header;
@property (nonatomic, strong, nullable) NSString *cardNo;
@property (nonatomic, assign) NSInteger accountStatus;
@property (nonatomic, strong, nullable) NSDate *createTime;
@property (nonatomic, strong, nullable) NSDate *updateTime;
@property (nonatomic, copy, nullable) NSString *token;

@property (nonatomic, strong) UIImage *headerImage;

/**
 是否曾经登录过
 */
@property (nonatomic, assign) BOOL savedUser;
/**
 现在是否已经登录
 */
@property (nonatomic, assign) BOOL logined;

- (void)loginWithPhone:(NSString *)phone
                  code:(NSString *)code
                succed:(void(^)(NSString *msg))succed
                failed:(void(^)(NSString *msg))failed;

- (void)logout;

@end

NS_ASSUME_NONNULL_END
