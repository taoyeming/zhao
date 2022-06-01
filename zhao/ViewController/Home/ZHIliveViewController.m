//
//  ZHIliveViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHIliveViewController.h"

@implementation ZHIliveViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.title = @"ILIVE";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_ilive"];
    }
    return self;
}
@end
