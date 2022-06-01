//
//  ZHSignOptionsView.h
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZHSignOptionsViewDelegate <NSObject>

- (void)signOptionsViewDelegateClickWithIndex:(NSInteger)index title:(NSString *)title;

@end

@interface ZHSignOptionsView : UIView

@property (nonatomic, copy) NSArray<NSString *> *titles;

@property (nonatomic, weak) id<ZHSignOptionsViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
