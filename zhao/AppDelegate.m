//
//  AppDelegate.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    UIWindow *_window;
}

@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [UIWindow new];
    [self.window makeKeyWindow];
    
    [RACObserve([ZHUserManager shared], logined) subscribeNext:^(NSNumber* logined) {
        if(logined.boolValue) {
            [ZHRoute openHome];
        } else {
            if([ZHUserManager shared].savedUser) {
                [ZHRoute openRelogin];
            } else {
                [ZHRoute openSignIn];
            }
        }
    }];
    return YES;
}


#pragma mark - Get & Set

- (void)setWindow:(UIWindow *)window {
    _window = window;
}

- (UIWindow *)window {
    return _window;
}

@end
