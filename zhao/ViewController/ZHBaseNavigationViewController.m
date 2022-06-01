//
//  ZHBaseNavigationViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/21.
//

#import "ZHBaseNavigationViewController.h"

@interface ZHBaseNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation ZHBaseNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if(self) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.viewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
}

@end
