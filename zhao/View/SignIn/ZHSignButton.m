//
//  ZHSignButton.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHSignButton.h"
#import "ZHColor.h"

@implementation ZHSignButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        
        self.titleLabel.font = [ZHFont normalMisansFontOfSize:20];
        
        self.backgroundColor = [ZHColor colorWithHex:@"#2A82E4"];
        self.titleLabel.textColor = [ZHColor colorWithHex:@"#FFFFFF"];
        
        [self setTitleColor:[ZHColor colorWithHex:@"#FFFFFF"] forState:UIControlStateNormal];
        
        self.enabled = YES;
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    if(enabled) {
        self.alpha = 1;
    } else {
        self.alpha = 0.27;
    }
}

@end
