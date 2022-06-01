//
//  ZHBaseNavView.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHBaseNavView.h"
#import "ZHColor.h"
#import <Masonry/Masonry.h>

@interface ZHBaseNavView()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation ZHBaseNavView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _backButton = [UIButton new];
        [self addSubview:_backButton];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [_backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
        [_backButton setImage:[[UIImage imageNamed:@"close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        _backButton.tintColor = [ZHColor colorWithHex:@"#222227"];
        
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [ZHColor colorWithHex:@"#222227"];
        _titleLabel.font = [ZHFont MediumMisansFontOfSize:20];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(54);
            make.right.equalTo(self).offset(-54);
            make.height.mas_equalTo(44);
            make.bottom.equalTo(self);
        }];
        
        _rightButton = [UIButton new];
        [self addSubview:_rightButton];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
    }
    return self;
}

#pragma mark - Touch event

- (void)clickBackButton {
    if(![self.delegate isKindOfClass:[UIViewController class]])
        return;
    if(self.delegate.navigationController) {
        if(self.delegate.navigationController.viewControllers.count < 2) {
            [self.delegate.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [self.delegate.navigationController popViewControllerAnimated:YES];
        }
    } else {
        [self.delegate dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)clickRightButton {
    if([self.delegate performSelector:@selector(clickRightButton)]) {
        [self.delegate clickRightButton];
    }
}

#pragma mark - Get & Set

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (NSString *)title {
    return _titleLabel.text;
}

- (void)setBackMode:(BOOL)backMode {
    _backMode = backMode;
    
    if(_backMode) {
        [_backButton setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    } else {
        [_backButton setImage:[[UIImage imageNamed:@"close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    }
}

@end
