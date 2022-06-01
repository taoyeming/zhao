//
//  ZHSignLicenseView.h
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import <UIKit/UIKit.h>
#import "ZHRatioButton.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZHSignLicenseViewDelegate <NSObject>

- (void)clickLicenseButton;

@end

@interface ZHSignLicenseView : UIView

@property (nonatomic, strong) ZHRatioButton *button;

@property (nonatomic, weak) id<ZHSignLicenseViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
