//
//  ZHRoute.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHRoute.h"
#import "ZHBaseNavigationViewController.h"
#import "ZHLicenseViewController.h"
#import "ZHSignInViewController.h"
#import "ZHHomeTabBarController.h"
#import "ZHUserCenterViewController.h"
#import "ZHCodeViewController.h"
#import "ZHAccountSafeViewController.h"
#import "ZHFreezeViewController.h"
#import "ZHReloadLoginViewController.h"
#import "ZHLogoutViewController.h"

@implementation ZHRoute

+ (void)openUserCenter {
    [self pushViewController:[ZHUserCenterViewController new]];
}

+ (void)openAccountSafe {
    [self pushViewController:[ZHAccountSafeViewController new]];
}

+ (void)openAccountFreeze {
    ZHFreezeViewController *vc = [ZHFreezeViewController new];
    vc.freezeType = ZHFreezeViewControllerTypeFreeze;
    [self pushViewController:vc];
}

+ (void)openSignOutFrom:(UIViewController *)vc {
    ZHLogoutViewController *lvc = [ZHLogoutViewController new];
    [vc presentViewController:lvc animated:YES completion:nil];
}

+ (void)openAccountUnfreeze {
    ZHFreezeViewController *vc = [ZHFreezeViewController new];
    vc.freezeType = ZHFreezeViewControllerTypeUnfreeze;
    [self pushViewController:vc];
}

+ (void)pushSignIn {
    ZHSignInViewController *vc = [ZHSignInViewController new];
    [self pushViewController:vc];
}

+ (void)openSignIn {
    ZHSignInViewController *vc = [ZHSignInViewController new];
    vc.showBackButton = NO;
    ZHBaseNavigationViewController *nvc = [[ZHBaseNavigationViewController alloc] initWithRootViewController:vc];
    [self setRootViewController:nvc];
}

+ (void)openRelogin {
    ZHReloadLoginViewController *vc = [ZHReloadLoginViewController new];
    vc.showBackButton = NO;
    ZHBaseNavigationViewController *nvc = [[ZHBaseNavigationViewController alloc] initWithRootViewController:vc];
    [self setRootViewController:nvc];
}

+ (void)openHome {
    ZHHomeTabBarController *vc = [ZHHomeTabBarController new];
    vc.showBackButton = NO;
    [self setRootViewController:vc];
}

+ (void)openLoginCodeWithPhone:(NSString *)phone {
    ZHCodeViewController *vc = [ZHCodeViewController new];
    vc.phone = phone;
    [self pushViewController:vc];
}

+ (void)openLicense {
    ZHLicenseViewController *vc = [ZHLicenseViewController new];
    [self presentViewController:vc];
}

+ (void)pushViewController:(UIViewController *)viewControllerToPresent {
    [self pushViewController:viewControllerToPresent animated:YES backWhenExist:NO];
}

+ (void)pushViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag backWhenExist:(BOOL)backWhenExist {
    UIViewController *vc = [self currentViewController];
    if(!vc.navigationController) {
        [self presentViewController:[[ZHBaseNavigationViewController alloc] initWithRootViewController:viewControllerToPresent]];
    } else {
        if(backWhenExist) {
            NSArray<UIViewController *> *vcs = vc.navigationController.viewControllers;
            for (UIViewController *vc in vcs) {
                if([viewControllerToPresent isMemberOfClass:[vc class]]) {
                    [vc.navigationController popToViewController:vc animated:YES];
                    return;
                }
            }
            [vc.navigationController pushViewController:viewControllerToPresent animated:flag];
        } else {
            [vc.navigationController pushViewController:viewControllerToPresent animated:flag];
        }
    }
}

+ (void)presentViewController:(UIViewController *)viewControllerToPresent {
    [self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^ __nullable)(void))completion  {
    [[self currentViewController] presentViewController:viewControllerToPresent animated:flag completion:completion];
}

+ (void)setRootViewController:(UIViewController *)viewController {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(window.rootViewController) {
        [UIView transitionWithView:window
                          duration:0.3
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
            BOOL oldState = [UIView areAnimationsEnabled];
            [UIView setAnimationsEnabled:NO];
            window.rootViewController = viewController;
            [window makeKeyAndVisible];
            [UIView setAnimationsEnabled:oldState];
        } completion:nil];
    } else {
        window.rootViewController = viewController;
        [window makeKeyAndVisible];
    }
}

+ (UIViewController *)currentViewController {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return [self topViewControllerFrom:window.rootViewController];
}

+ (UIViewController *)topViewControllerFrom:(UIViewController *)vc {
    if([vc isKindOfClass:[UITabBarController class]] && [(UITabBarController *)vc selectedViewController]) {
        return [self topViewControllerFrom:[(UITabBarController *)vc selectedViewController]];
    }
    if([vc isKindOfClass:[UINavigationController class]] && [(UINavigationController *)vc topViewController]) {
        return [self topViewControllerFrom:[(UINavigationController *)vc topViewController]];
    }
    if(vc.presentedViewController) {
        return [self topViewControllerFrom:vc.presentedViewController];
    }
    return vc;
}

@end
