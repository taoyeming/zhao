//
//  ZHRatioButton.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHRatioButton.h"

@implementation ZHRatioButton

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setImage:[UIImage imageNamed:@"ratioSelected"] forState:UIControlStateSelected];
        [self setImage:[UIImage imageNamed:@"ratioNormal"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(clickSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickSelf {
    self.selected = !self.selected;
}

@end
