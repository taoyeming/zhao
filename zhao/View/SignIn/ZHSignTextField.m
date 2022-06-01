//
//  ZHSignTextField.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHSignTextField.h"

@implementation ZHSignTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.font = [ZHFont lightMisansFontOfSize:20];
        
        UIView *grayView = [UIView new];
        [self addSubview:grayView];
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        grayView.backgroundColor = [ZHColor colorWithHex:@"#929297"];
        
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end
