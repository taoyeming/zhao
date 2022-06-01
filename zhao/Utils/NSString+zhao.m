//
//  NSString+zhao.m
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "NSString+zhao.h"

@implementation NSString (zhao)

- (BOOL)isMobileNumber {
    NSString* mobile = @"^1\\d{10}$";
    NSPredicate *regextestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [regextestMobile evaluateWithObject:self];
}

- (NSString *)hideCenter4Number {
    NSRange range = NSMakeRange(3, 4);
    if(self.length < 8) return self;
    return [self stringByReplacingCharactersInRange:range withString:@"****"];
}

@end
