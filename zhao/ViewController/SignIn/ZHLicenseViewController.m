//
//  ZHLicenseViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHLicenseViewController.h"
#import "ZHSignLicenseView.h"

@interface ZHLicenseViewController ()

@end

@implementation ZHLicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"微网用户协议";
    
//    UIButton *closeButton = [UIButton new];
//    [self.view addSubview:closeButton];
//    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        if (@available(iOS 11.0, *)) {
//            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
//        } else {
//            make.bottom.equalTo(self.view.mas_bottom);
//        }
//        make.size.mas_equalTo(CGSizeMake(44, 44));
//    }];
//    [closeButton setImage:[[UIImage imageNamed:@"lice_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
//    closeButton.tintColor = [ZHColor colorWithHex:@"#222227"];
//    [closeButton addTarget:self action:@selector(clickCloseButton) forControlEvents:UIControlEventTouchUpInside];
    
    UITextView *textView = [UITextView new];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.mas_bottom);
        make.left.equalTo(self.view).offset(19);
        make.right.equalTo(self.view).offset(-19);
        make.bottom.equalTo(self.view);
    }];
    textView.font = [ZHFont lightMisansFontOfSize:16];
    textView.textColor = [ZHColor colorWithHex:@"#222227"];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = @"欢迎你使用微网软件及服务！\n为使用ILIVE软件（以下简称“本软件”）及服务，你应当阅读并遵守《ILIVE软件许可及服务协议》（以下简称“本协议”），以及《腾讯服务协议》 。请你务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗等形式提示你注意。\n除非你已阅读并接受本协议所有条款，否则你无权下载、安装或使用本软件及相关服务。你的下载、安装、使用、获取微信帐号、登录等行为即视为你已阅读并同意上述协议的约束。\n如果你未满18周岁，请在法定监护人的陪同下阅读本协议及上述其他协议，并特别注意未成年人使用条款。特别地，如果你是未满14周岁的儿童，则在完成帐号注册前，还应请你的监护人仔细阅读腾讯公司专门制定的《儿童隐私保护声明》。只有在取得监护人对《儿童隐私保护声明》的同意后，未满14周岁的儿童方可使用微信服务。\n一、协议的范围\n1.1 协议适用主体范围\n本协议是你与腾讯之间关于你下载、安装、使用、复制";
}

#pragma mark - Touch event

- (void)clickCloseButton {
    [self.navView clickBackButton];
}

@end
