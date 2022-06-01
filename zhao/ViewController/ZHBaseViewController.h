//
//  ZHBaseViewController.h
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

NS_ASSUME_NONNULL_BEGIN

@interface ZHBaseViewController : UIViewController

@property (nonatomic, strong) ZHBaseNavView *navView;

@property (nonatomic, assign) BOOL showBackButton;

- (void)showErrorWithMessage:(NSString *)message delay:(NSInteger)delay;

- (MBProgressHUD *)showLoadingWithMessage:(nullable NSString *)message image:(nullable UIImage *)image imageTintColor:(nullable UIColor *)imageTintColor;

- (void)showLoading;

- (void)dismisssLoading;

@end

NS_ASSUME_NONNULL_END
