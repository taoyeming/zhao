//
//  ZHBaseTabBarController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHBaseTabBarController.h"

@interface ZHBaseTabBarController ()

@end

@implementation ZHBaseTabBarController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
        
        self.tabBar.backgroundColor = [ZHColor colorWithHex:@"#FFFFFF"];
        
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

@end
