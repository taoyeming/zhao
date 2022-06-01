//
//  ZHSignLicenseView.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHSignLicenseView.h"
#import <Masonry/Masonry.h>
#import <YYText/YYText.h>
#import "ZHColor.h"

@interface ZHSignLicenseView()

@property (nonatomic, strong) YYLabel *label;

@end

@implementation ZHSignLicenseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _button = [ZHRatioButton new];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(-8);
            make.top.equalTo(self).offset(2-8);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        _label = [YYLabel new];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self.button.mas_right);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        _label.preferredMaxLayoutWidth = 100;
        _label.numberOfLines = 0;
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"我已阅读并同意《微网用户协议》、《隐私政策》、《中国移动认证服务条款》，并授权微网使用本页面收集的账号信息进行统一管理。"];
        [text setYy_font:[ZHFont ExtraLightMisansFontOfSize:14]];
        [text setYy_color:[ZHColor colorWithHex:@"#929297"]];
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        __weak typeof(self) weakSelf = self;
        [highlight setColor:[ZHColor blueColor]];
        highlight.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [weakSelf clickHightlight];
        };
        
        [text yy_setColor:[ZHColor colorWithHex:@"#2A82E4"] range:NSMakeRange(7, 28)];
        [text yy_setTextHighlight:highlight range:NSMakeRange(7, 28)];
        
        _label.attributedText = text;
        [_label sizeToFit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_label sizeToFit];
}

- (void)clickHightlight {
    if([self.delegate respondsToSelector:@selector(clickLicenseButton)]) {
        [self.delegate clickLicenseButton];
    }
}

@end
