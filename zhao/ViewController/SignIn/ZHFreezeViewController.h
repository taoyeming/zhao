//
//  ZHFreezeViewController.h
//  zhao
//
//  Created by taoyeming on 2022/5/28.
//

#import "ZHBaseViewController.h"

typedef NS_ENUM(NSUInteger, ZHFreezeViewControllerType) {
    ZHFreezeViewControllerTypeFreeze,
    ZHFreezeViewControllerTypeUnfreeze,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZHFreezeViewController : ZHBaseViewController

@property (nonatomic, assign) ZHFreezeViewControllerType freezeType;

@end

NS_ASSUME_NONNULL_END
