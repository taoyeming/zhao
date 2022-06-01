//
//  ZHMyTableViewCell.h
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHMyTableViewCell : ZHBaseTableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *rightImageView;

@end

NS_ASSUME_NONNULL_END
