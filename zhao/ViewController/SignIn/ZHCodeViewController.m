//
//  ZHCodeViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHCodeViewController.h"
#import "CodeInputView.h"
#import "ZHLoginNetwork.h"
#import "ZHUserManager.h"

@interface ZHCodeViewController ()

@property (nonatomic, strong) UIButton *infoButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) CodeInputView *inputView;

@property (nonatomic, strong) UILabel *reloadCodeLabel;

@property (nonatomic, assign) NSTimeInterval time;

@property (nonatomic, strong) ZHLoginNetwork *network;

@end

@implementation ZHCodeViewController

- (void)viewDidLoad {
    _time = [[NSDate date] timeIntervalSince1970];
    
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
    _titleLabel.text = @"输入验证码";
    _titleLabel.textColor = [ZHColor colorWithHex:@"#020207"];
    
    _detailLabel = [UILabel new];
    [self.view addSubview:_detailLabel];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(7);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@19);
    }];
    _detailLabel.text = [NSString stringWithFormat:@"验证码已发送至：%@", [_phone hideCenter4Number]];
    _detailLabel.font = [ZHFont ExtraLightMisansFontOfSize:14];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.textColor = [ZHColor colorWithHex:@"#222227"];
    
#define CODE_NUM 4
    @weakify(self);
    _inputView = [[CodeInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50) inputType:CODE_NUM selectCodeBlock:^(NSString * str) {
        @strongify(self);
        if(str.length == CODE_NUM) {
            [self enterCodeWith:str];
        }
    }];
    [self.view addSubview:_inputView];
    
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_detailLabel.mas_bottom).mas_offset(28);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(52));
    }];
    
    _reloadCodeLabel = [UILabel new];
    [self.view addSubview:_reloadCodeLabel];
    [_reloadCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_inputView.mas_bottom).offset(13);
        make.height.equalTo(@44);
    }];
    _reloadCodeLabel.textColor = [ZHColor colorWithHex:@"#525257"];
    _reloadCodeLabel.font = [ZHFont lightMisansFontOfSize:15];
    _reloadCodeLabel.textAlignment = NSTextAlignmentCenter;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickReloadCodeLabel)];
    [_reloadCodeLabel addGestureRecognizer:tap];
    _reloadCodeLabel.userInteractionEnabled = YES;
    [self addAction];
}

#pragma mark - Set

- (void)setPhone:(NSString *)phone {
    _phone = [phone copy];
    _detailLabel.text = [NSString stringWithFormat:@"验证码已发送至：%@", [_phone hideCenter4Number]];
}

#pragma mark - Private method

- (void)addAction {
    @weakify(self);
    [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] startWith:[NSDate date]] subscribeNext:^(NSDate * _Nullable x) {
        @strongify(self);
        NSTimeInterval time = [self timeToCanGetNewCode];
        if(time > 0) {
            self.reloadCodeLabel.text = [NSString stringWithFormat:@"%ld秒后重新获取验证码", (long)time];
        } else {
            self.reloadCodeLabel.text = @"重新获取验证";
        }
    }];
    
    [[_infoButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [ZHRoute openAccountSafe];
    }];
}

- (void)enterCodeWith:(NSString *)code {
    
    [[ZHUserManager shared] loginWithPhone:self.phone
                                      code:code
                                    succed:^(NSString * _Nonnull msg) {
    } failed:^(NSString * _Nonnull msg) {
        [self.inputView clear];
        [self showErrorWithMessage:msg delay:3.0];
    }];
}

- (long)timeToCanGetNewCode {
    return (long)(_time + 60 - [[NSDate date] timeIntervalSince1970]);
}

- (void)clickReloadCodeLabel {
    NSTimeInterval time = [self timeToCanGetNewCode];
    if(time > 0) {
        return;
    }
    _time = [[NSDate date] timeIntervalSince1970];
    
    [_network getCodeWithPhone:self.phone ?: @""
                        succed:^(NSDictionary * _Nonnull dict, NSString * _Nonnull msg) { }
                        failed:^(NSString * _Nonnull msg) {
        [self showErrorWithMessage:msg delay:3.0];
    }];
}


@end
