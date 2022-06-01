//
//  ZHSignPhoneTextField.m
//  zhao
//
//  Created by taoyeming on 2022/5/21.
//

#import "ZHSignPhoneTextField.h"

@implementation ZHSignPhoneTextField

#pragma mark - Life crycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.keyboardType = UIKeyboardTypePhonePad;
        self.placeholder = @"请输入手机号";
        
        _closeButton = [UIButton new];
        [self addSubview:_closeButton];
        [_closeButton setImage:[UIImage imageNamed:@"phoneClear"] forState:UIControlStateNormal];
        [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        
        @weakify(self);
        [self.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            @strongify(self);
            self.closeButton.hidden = x.length < 1;
            
            if(x.length > 11) {
                self.text = [x substringToIndex:11];
            }
        }];
        
        [[self.closeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            self.text = @"";
        }];
        
        self.font = [ZHFont lightMisansFontOfSize:20];
        
        UIView *grayView = [UIView new];
        [self addSubview:grayView];
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        grayView.backgroundColor = [ZHColor colorWithHex:@"#929297"];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if(CGRectContainsPoint([_closeButton convertRect:_closeButton.bounds toView:self], point)) {
        return _closeButton;
    }
    return [super hitTest:point withEvent:event];
}

@end
