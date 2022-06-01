//
//  ZHSignInViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/21.
//

#import "ZHSignInViewController.h"
#import "ZHSignTextField.h"
#import "ZHSignLicenseView.h"
#import "ZHSignButton.h"
#import "ZHSignOptionsView.h"
#import "ZHSignPhoneTextField.h"
#import "ZHLoginNetwork.h"

@interface ZHSignInViewController () <ZHSignLicenseViewDelegate>

@property (nonatomic, strong) UIButton *infoButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) ZHSignPhoneTextField *phoneTextField;

@property (nonatomic, strong) ZHSignButton *loginButton;

@property (nonatomic, strong) ZHSignOptionsView *optionsView;

@property (nonatomic, strong) ZHSignLicenseView *licenseView;

@property (nonatomic, strong) ZHLoginNetwork *network;

@end

@implementation ZHSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _infoButton = [UIButton new];
    [self.view addSubview:_infoButton];
    [_infoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view.mas_top).offset(20);
        }
        make.right.equalTo(self.view.mas_right).offset(-8);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [_infoButton setImage:[[UIImage imageNamed:@"login_info"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [_infoButton setTintColor:[ZHColor colorWithHex:@"#020207"]];
    
    _titleLabel = [UILabel new];
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_infoButton.mas_bottom).offset(74);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@31);
    }];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [ZHFont lightMisansFontOfSize:31];
    _titleLabel.text = @"欢迎登录微网";
    _titleLabel.textColor = [ZHColor colorWithHex:@"#020207"];
    
    _phoneTextField = [ZHSignPhoneTextField new];
    [self.view addSubview:_phoneTextField];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(82);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(252/428.0);
        make.height.equalTo(@39);
    }];
    
    UILabel *detailLabel = [UILabel new];
    [self.view addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@19);
    }];
    detailLabel.text = @"未注册的手机号验证后自动创建微网账号";
    detailLabel.font = [ZHFont ExtraLightMisansFontOfSize:14];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.textColor = [ZHColor colorWithHex:@"#929297"];
    
    
    _licenseView = [ZHSignLicenseView new];
    [self.view addSubview:_licenseView];
    [_licenseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(detailLabel.mas_bottom).offset(49);
        make.width.equalTo(self.view).multipliedBy((428-62-62)/428.0);
    }];
    _licenseView.delegate = self;
    
    _loginButton = [ZHSignButton new];
    [self.view addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_licenseView.mas_bottom).offset(49);
        make.width.equalTo(self.view).multipliedBy((428-110)/428.0);
        make.height.equalTo(@56);
    }];
    [_loginButton setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    
    [self addAction];
}

#pragma mark - Private method

- (void)addAction {
    @weakify(self);
    [[RACSignal combineLatest:@[
            RACObserve(_licenseView.button, selected),
            _phoneTextField.rac_textSignal
        ] reduce:^id (NSNumber *licenseSelected, NSString *phone){
            return @(licenseSelected.boolValue && phone.length > 10);
    }] subscribeNext:^(NSNumber*  _Nullable loginEnable) {
        @strongify(self);
        self.loginButton.enabled = loginEnable.boolValue;
    }];
    
    [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        NSString *phone = self.phoneTextField.text;
        if(!phone.isMobileNumber) {
            [self showErrorWithMessage:@"请输入完整的手机号" delay:3.0];
            return;
        }
        if(!self.licenseView.button.selected) {
            [self showErrorWithMessage:@"请阅读并同意服务条款" delay:3.0];
            return;
        }
        
        
        [self.network getCodeWithPhone:phone succed:^(NSDictionary * _Nonnull dict, NSString * _Nonnull msg) {
            [ZHRoute openLoginCodeWithPhone:phone];
        } failed:^(NSString * _Nonnull msg) {
            [self showErrorWithMessage:msg delay:3.0];
        }];
    }];
    
    [[_infoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openAccountSafe];
    }];
}

#pragma mark - ZHSignLicenseViewDelegate

- (void)clickLicenseButton {
    [ZHRoute openLicense];
}

#pragma mark - Lazy load

- (ZHLoginNetwork *)network {
    if(!_network) {
        _network = [ZHLoginNetwork new];
    }
    return _network;
}

@end
