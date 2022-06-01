//
//  NSString+zhao.h
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (zhao)

- (BOOL)isMobileNumber;

- (NSString *)hideCenter4Number;

@end

NS_ASSUME_NONNULL_END
