//
//  ZHRoute.h
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHRoute : NSObject

+ (void)openLicense;

+ (void)openSignIn;

+ (void)pushSignIn;

+ (void)openSignOutFrom:(UIViewController *)vc;

+ (void)openHome;

+ (void)openAccountSafe;

+ (void)openAccountFreeze;

+ (void)openAccountUnfreeze;

+ (void)openRelogin;

+ (void)openLoginCodeWithPhone:(NSString *)phone;

+ (void)openUserCenter;

@end

NS_ASSUME_NONNULL_END
