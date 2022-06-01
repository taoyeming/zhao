//
//  ZHAccountSafeViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHAccountSafeViewController.h"
#import "ZHSignButton.h"

@interface ZHAccountSafeViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) ZHSignButton *freezeButton;
@property (nonatomic, strong) ZHSignButton *unfreezeButton;
@property (nonatomic, strong) ZHSignButton *allegeButton;

@end

@implementation ZHAccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _titleLabel = [UILabel new];
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(74 + 44);
        } else {
            make.top.equalTo(self.view.mas_top).offset(74 + 44 + 20);
        }
        make.left.right.equalTo(self.view);
        make.height.equalTo(@31);
    }];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [ZHFont lightMisansFontOfSize:31];
    _titleLabel.text = @"微网账户安全";
    _titleLabel.textColor = [ZHColor colorWithHex:@"#020207"];
    
    _freezeButton = [ZHSignButton new];
    [self.view addSubview:_freezeButton];
    [_freezeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.height.equalTo(@56);
    }];
    [_freezeButton setTitle:@"冻结账户" forState:UIControlStateNormal];
    [[_freezeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openAccountFreeze];
    }];
    
    _unfreezeButton = [ZHSignButton new];
    [self.view addSubview:_unfreezeButton];
    [_unfreezeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_freezeButton.mas_bottom).mas_offset(27);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.height.equalTo(@56);
    }];
    [_unfreezeButton setTitle:@"解冻账户" forState:UIControlStateNormal];
    [[_unfreezeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openAccountUnfreeze];
    }];
    
    _allegeButton = [ZHSignButton new];
    [self.view addSubview:_allegeButton];
    [_allegeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_unfreezeButton.mas_bottom).mas_offset(27);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.height.equalTo(@56);
    }];
    [_allegeButton setTitle:@"账户申诉" forState:UIControlStateNormal];
}

@end
