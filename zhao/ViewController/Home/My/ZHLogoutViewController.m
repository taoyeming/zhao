//
//  ZHLogoutViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/29.
//

#import "ZHLogoutViewController.h"

@interface ZHLogoutViewController () <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UIButton *logoutButton;

@property (nonatomic, strong) UIView *whiteView;

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation ZHLogoutViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backgroundView = [UIView new];
    _backgroundView.alpha = 0.5;
    _backgroundView.backgroundColor = [ZHColor colorWithHex:@"#222227"];
    [self.view addSubview:_backgroundView];
    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.navView.hidden = YES;
    
    _whiteView = [UIView new];
    [self.view addSubview:_whiteView];
    _whiteView.backgroundColor = [ZHColor colorWithHex:@"#FFFFFF"];
    _whiteView.layer.cornerRadius = 10;
    _whiteView.clipsToBounds = YES;
    
    _cancelButton = [UIButton new];
    [self.view addSubview:_cancelButton];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view.mas_bottom);
        }
        make.height.equalTo(@60);
    }];
    [_cancelButton setTitleColor:[ZHColor colorWithHex:@"#222227"] forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [ZHFont lightMisansFontOfSize:20];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    UIView *grayView = [UIView new];
    [self.view addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_cancelButton.mas_top);
        make.height.equalTo(@10);
    }];
    grayView.backgroundColor = [ZHColor colorWithHex:@"#D2D2D2"];
    
    _logoutButton = [UIButton new];
    [self.view addSubview:_logoutButton];
    [_logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(grayView.mas_top);
        make.height.equalTo(@60);
    }];
    [_logoutButton setTitleColor:[ZHColor colorWithHex:@"#D43030"] forState:UIControlStateNormal];
    _logoutButton.titleLabel.font = [ZHFont lightMisansFontOfSize:20];
    [_logoutButton setTitle:@"安全退出" forState:UIControlStateNormal];
    
    UIView *grayView2 = [UIView new];
    [self.view addSubview:grayView2];
    [grayView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_logoutButton.mas_top);
        make.height.equalTo(@1);
    }];
    grayView2.backgroundColor = [ZHColor colorWithHex:@"#D2D2D2"];
    
    UILabel *titleLabel = [UILabel new];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(grayView2.mas_top);
        make.height.equalTo(@84);
    }];
    titleLabel.font = [ZHFont lightMisansFontOfSize:16];
    titleLabel.textColor = [ZHColor colorWithHex:@"#727277"];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"感谢您使用微网账户，欢迎下次登录！";
    
    [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(10);
        make.top.equalTo(titleLabel);
    }];
    
    [self addAction];
}

- (void)addAction {
    @weakify(self);
    [[_cancelButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [[_logoutButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[ZHUserManager shared] logout];
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey]?:toVC.view;
    UIView* fromView = [transitionContext viewForKey:UITransitionContextFromViewKey]?:fromVC.view;
    UIView* containerView = [transitionContext containerView];
    
    CGRect conBounds = containerView.bounds;
    CGRect hideRect = CGRectMake(0, conBounds.size.height, conBounds.size.width, conBounds.size.height);
    CGRect displayRect = CGRectMake(0, 0, conBounds.size.width, conBounds.size.height);
    
    UIView *grayView = [UIView new];
    grayView.frame = displayRect;
    grayView.backgroundColor = [ZHColor colorWithHex:@"#222227"];
    [containerView addSubview:grayView];
    
    if(toView == self.view) {
        toView.frame = hideRect;
        [containerView addSubview:toView];
        grayView.alpha = 0;
        
        _backgroundView.alpha = 0;
        [UIView animateWithDuration:0.35 animations:^{
            toView.frame = displayRect;
            grayView.alpha = 0.5;
        } completion:^(BOOL finished) {
            self.backgroundView.alpha = 0.5;
            [grayView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    } else {
        self.backgroundView.alpha = 0;
        fromView.frame = displayRect;
        [fromView bringSubviewToFront:grayView];
        grayView.alpha = 0.5;
        [UIView animateWithDuration:0.35 animations:^{
            fromView.frame = hideRect;
            grayView.alpha = 0;
        } completion:^(BOOL finished) {
            [grayView removeFromSuperview];
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }

    
}

@end
