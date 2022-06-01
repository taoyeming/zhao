//
//  ZHBaseViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHBaseViewController.h"

@interface ZHBaseViewController ()<ZHBaseNavViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, weak) MBProgressHUD *hud;

@end

@implementation ZHBaseViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.showBackButton = YES;
        
        self.hidesBottomBarWhenPushed = YES;
        
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [ZHColor colorWithHex:@"#FFFFFF"];
    
    _navView = [ZHBaseNavView new];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(44);
        } else {
            make.bottom.equalTo(self.view.mas_top).offset(44+20);
        }
    }];
    _navView.title = self.title;
    
    if(self.navigationController
       && self.navigationController.viewControllers.firstObject != self) {
        _navView.backMode = YES;
    } else {
        _navView.backMode = NO;
    }
    
    @weakify(self);
    [RACObserve(self, showBackButton) subscribeNext:^(NSNumber*  _Nullable showBackButton) {
        @strongify(self);
        self.navView.hidden = !showBackButton.boolValue;
    }];
    
    _navView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    
    _navView.title = title;
}

- (void)showErrorWithMessage:(NSString *)message delay:(NSInteger)delay {
    UIImage *image = [[UIImage imageNamed:@"hud_warning"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    MBProgressHUD *hud = [self showLoadingWithMessage:message image:image imageTintColor:[ZHColor colorWithHex:@"#FFFFFF"]];
    
    [self tapticEngine];

    
    [hud hideAnimated:YES afterDelay:delay];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismisssLoading)];
    [hud addGestureRecognizer:tap];
}

- (MBProgressHUD *)showLoadingWithMessage:(NSString *)message image:(UIImage *)image imageTintColor:(UIColor *)imageTintColor {
    if(self.hud)
        return nil;
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if(message) {
        self.hud.label.text = message;
        self.hud.label.textColor = [ZHColor colorWithHex:@"#FFFFFF"];
        self.hud.label.font = [ZHFont lightMisansFontOfSize:18];
    }
    if(image) {
        self.hud.mode = MBProgressHUDModeCustomView;
        UIImageView *imageView = [UIImageView new];
        imageView.image = image;
        if(imageTintColor) {
            imageView.tintColor = [ZHColor colorWithHex:@"#FFFFFF"];
        }
        self.hud.customView = imageView;
    }
    return self.hud;
}

- (void)showLoading {
    [self showLoadingWithMessage:nil image:nil imageTintColor:nil];
}

- (void)dismisssLoading {
    [self.hud hideAnimated:YES];
}

- (void)tapticEngine {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedBackGenertor impactOccurred];
    }
}

@end
