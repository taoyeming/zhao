//
//  ZHTextField.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHTextField.h"

@implementation ZHTextField

#pragma mark - Life crycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        self.font = [ZHFont normalMisansFontOfSize:20];
    }
    return self;
}

@end
