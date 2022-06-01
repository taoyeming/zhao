//
//  ZHBaseNavView.h
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZHBaseNavViewDelegate <NSObject>

@optional
- (void)clickRightButton;

@end

@interface ZHBaseNavView : UIView

/**
 是显示返回的箭头还是关闭的按钮
 */
@property (nonatomic, assign) BOOL backMode;

@property (nonatomic, weak) UIViewController<ZHBaseNavViewDelegate> *delegate;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIButton *backButton;

- (void)clickBackButton;

@end

NS_ASSUME_NONNULL_END
