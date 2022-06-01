//
//  ZHBiometricsViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHBiometricsViewController.h"
#import "ZHSignOptionsView.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ZHBiometricsViewController ()

@property (nonatomic, strong) UIButton *checkButton;

@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) ZHSignOptionsView *optionsView;

@end

@implementation ZHBiometricsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _checkButton = [UIButton new];
    [self.view addSubview:_checkButton];
    [_checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset((self.view.frame.size.height * 0.274));
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [_checkButton addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
    [self setupCheckButton];
    
    _stateLabel = [UILabel new];
    [self.view addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).mas_offset(-(self.view.frame.size.height * 0.181));
        make.centerX.equalTo(self.view);
        make.left.right.equalTo(self.view);
    }];
    _stateLabel.textAlignment = NSTextAlignmentCenter;
    
    _optionsView = [ZHSignOptionsView new];
    [self.view addSubview:_optionsView];
    _optionsView.titles = @[
        @"找回密码",
        @"紧急冻结",
        @"登录选项",
    ];
    [_optionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view.mas_bottom).offset(-10);
        }
        make.width.equalTo(@300);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@44);
    }];
}

- (void)check {
    LAContext *context = [LAContext new];
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"验证是否本人" reply:^(BOOL success, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(success) {
                self.stateLabel.textColor = [ZHColor blueColor];
                self.stateLabel.text = @"验证通过";
            } else {
                self.stateLabel.text = @"验证失败3秒后重试";
                self.checkButton.enabled = NO;
//                self.stateLabel.textColor = [ZHColor deepGrayColor];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.checkButton.enabled = YES;
                    self.stateLabel.text = @"";
                });
            }
        });
    }];
}

- (void)setupCheckButton {
    LAContext *context = [LAContext new];
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil]) {
        BOOL faceid = context.biometryType == LABiometryTypeFaceID;
        if(faceid) {
            [_checkButton setImage:[UIImage imageNamed:@"faceenable"] forState:UIControlStateNormal];
            [_checkButton setImage:[UIImage imageNamed:@"facedisable"] forState:UIControlStateDisabled];
        } else {
            [_checkButton setImage:[UIImage imageNamed:@"finenable"] forState:UIControlStateNormal];
            [_checkButton setImage:[UIImage imageNamed:@"findisable"] forState:UIControlStateDisabled];
        }
    }
}

#pragma mark - Helper

+ (BOOL)canUse {
    return [[LAContext new] canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
}

@end
