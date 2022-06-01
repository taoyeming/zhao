//
//  ZHAddressBookViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHAddressBookViewController.h"

@implementation ZHAddressBookViewController

- (instancetype)init {
    self = [super init];
    if(self) {
        self.title = @"通讯录";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_addressbook"];
    }
    return self;
}

@end
