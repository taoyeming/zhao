//
//  ZHMyInfoTableViewCell.h
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHMyInfoTableViewCell : ZHBaseTableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIImageView *safeImageView;

@property (nonatomic, strong) UIImageView *qrcodeImageView;

@property (nonatomic, strong) UIImageView *rightImageView;

@end

NS_ASSUME_NONNULL_END
