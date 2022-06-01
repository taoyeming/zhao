//
//  ZHHomeTabBarController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHHomeTabBarController.h"
#import "ZHBaseNavigationViewController.h"

@interface ZHHomeTabBarController ()

@end

@implementation ZHHomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    self.viewControllers = @[
        [self nvWithClass:[ZHMessageViewController class]],
        [self nvWithClass:[ZHAddressBookViewController class]],
        [self nvWithClass:[ZHIliveViewController class]],
        [self nvWithClass:[ZHServicesViewController class]],
        [self nvWithClass:[ZHMyViewController class]],
    ];
}

- (UINavigationController *)nvWithClass:(Class)cls {
    ZHBaseViewController *vc = [cls new];
    vc.hidesBottomBarWhenPushed = NO;
    vc.showBackButton = NO;
    return [[ZHBaseNavigationViewController alloc] initWithRootViewController:vc];
}

@end
