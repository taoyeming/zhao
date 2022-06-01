//
//  ZHReloadLoginViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/29.
//

#import "ZHReloadLoginViewController.h"
#import "ZHSignButton.h"

@interface ZHReloadLoginViewController ()

@property (nonatomic, strong) UIButton *infoButton;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) ZHSignButton *getCodeButton;

@property (nonatomic, strong) UIButton *changeAccountButton;

@end

@implementation ZHReloadLoginViewController

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
    
    _iconImageView = [UIImageView new];
    [self.view addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_infoButton.mas_bottom).offset(70);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    _iconImageView.layer.cornerRadius = 60;
    _iconImageView.clipsToBounds = YES;
    _iconImageView.layer.borderWidth = 2;
    _iconImageView.layer.borderColor = [ZHColor colorWithHex:@"#F2F2F2"].CGColor;
    
    _phoneLabel = [UILabel new];
    [self.view addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@29);
        make.top.equalTo(_iconImageView.mas_bottom).offset(20);
    }];
    _phoneLabel.textAlignment = NSTextAlignmentCenter;
    _phoneLabel.font = [ZHFont normalMisansFontOfSize:22];
    _phoneLabel.textColor = [ZHColor colorWithHex:@"#222227"];
    
    _changeAccountButton = [UIButton new];
    [self.view addSubview:_changeAccountButton];
    [_changeAccountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view.mas_bottom).offset(-5);
        }
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@56);
    }];
    [_changeAccountButton setTitle:@"切换账号" forState:UIControlStateNormal];
    [_changeAccountButton setTitleColor:[ZHColor colorWithHex:@"#525257"] forState:UIControlStateNormal];
    [_changeAccountButton.titleLabel setFont:[ZHFont lightMisansFontOfSize:14]];
    
    _getCodeButton = [ZHSignButton new];
    [self.view addSubview:_getCodeButton];
    [_getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_changeAccountButton.mas_top).offset(-17);
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@56);
    }];
    [_getCodeButton setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    [_getCodeButton setTitleColor:[ZHColor colorWithHex:@"#FFFFFF"] forState:UIControlStateNormal];
    [_getCodeButton.titleLabel setFont:[ZHFont lightMisansFontOfSize:20]];
    
    [self addAction];
}

- (void)addAction {
    @weakify(self);
    [RACObserve([ZHUserManager shared], phone) subscribeNext:^(NSString*  _Nullable phone) {
        @strongify(self);
        self.phoneLabel.text = [phone hideCenter4Number];
    }];
    [RACObserve([ZHUserManager shared], headerImage) subscribeNext:^(UIImage*  _Nullable headerImage) {
        @strongify(self);
        self.iconImageView.image = headerImage;
    }];
    [[_getCodeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openLoginCodeWithPhone:[ZHUserManager shared].phone];
    }];
    [[_changeAccountButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute pushSignIn];
    }];
    [[_infoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openAccountSafe];
    }];
}

@end
