//
//  ZHFont.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHFont.h"

@implementation ZHFont

+ (UIFont *)normalMisansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"MiSans-Normal" size:size];
}

+ (UIFont *)lightMisansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"MiSans-Light" size:size];
}

+ (UIFont *)ExtraLightMisansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"MiSans-ExtraLight" size:size];
}

+ (UIFont *)MediumMisansFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"MiSans-Medium" size:size];;
}

@end
