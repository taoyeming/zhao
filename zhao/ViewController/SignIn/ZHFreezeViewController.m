//
//  ZHFreezeViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHFreezeViewController.h"
#import "ZHSignTextField.h"
#import "ZHSignButton.h"

@interface ZHFreezeViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) ZHSignTextField *phoneTextField;
@property (nonatomic, strong) ZHSignTextField *nameTextField;
@property (nonatomic, strong) ZHSignTextField *idCardTextField;
@property (nonatomic, strong) ZHSignButton *freezeButton;

@end

@implementation ZHFreezeViewController

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
//    _titleLabel.text = @"解冻微网账户";
    _titleLabel.textColor = [ZHColor colorWithHex:@"#020207"];
    
    _phoneTextField = [ZHSignTextField new];
    [self.view addSubview:_phoneTextField];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(82);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(252/428.0);
        make.height.equalTo(@39);
    }];
    _phoneTextField.placeholder = @"请输入手机号";
    _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    
    _nameTextField = [ZHSignTextField new];
    [self.view addSubview:_nameTextField];
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneTextField.mas_bottom).offset(34);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(252/428.0);
        make.height.equalTo(@39);
    }];
    _nameTextField.placeholder = @"请输入姓名";
    
    _idCardTextField = [ZHSignTextField new];
    [self.view addSubview:_idCardTextField];
    [_idCardTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextField.mas_bottom).offset(34);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(252/428.0);
        make.height.equalTo(@39);
    }];
    _idCardTextField.placeholder = @"请输入身份证号码";
    
    _freezeButton = [ZHSignButton new];
    [self.view addSubview:_freezeButton];
    [_freezeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_idCardTextField.mas_bottom).offset(27);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(320/428.0);
        make.height.equalTo(@56);
    }];
//    [_freezeButton setTitle:@"获取验证码解冻账户" forState:UIControlStateNormal];
    [self setFreezeType:_freezeType];
}

- (void)setFreezeType:(ZHFreezeViewControllerType)freezeType {
    _freezeType = freezeType;
    if(freezeType == ZHFreezeViewControllerTypeFreeze) {
        _titleLabel.text = @"冻结微网账户";
        [_freezeButton setTitle:@"冻结账户" forState:UIControlStateNormal];
    } else {
        _titleLabel.text = @"解冻微网账户";
        [_freezeButton setTitle:@"获取验证码解冻账户" forState:UIControlStateNormal];
    }
}

@end
