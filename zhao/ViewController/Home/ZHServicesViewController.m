//
//  ZHServicesViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHServicesViewController.h"

@implementation ZHServicesViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.title = @"服务";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_services"];
    }
    return self;
}

@end
