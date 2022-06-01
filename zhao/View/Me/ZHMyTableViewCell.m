//
//  ZHMyTableViewCell.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHMyTableViewCell.h"

@interface ZHMyTableViewCell()

@end

@implementation ZHMyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        UIView *whiteView = [UIView new];
        [self.contentView addSubview:whiteView];
        whiteView.backgroundColor = [ZHColor colorWithHex:@"#FFFFFF"];
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@62);
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 19, 5, 19));
        }];
        whiteView.layer.cornerRadius = 10;
        whiteView.clipsToBounds = YES;
        
        _leftImageView = [UIImageView new];
        [whiteView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(whiteView);
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.left.equalTo(whiteView).offset(9);
        }];
        
        _rightImageView = [UIImageView new];
        [whiteView addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(whiteView);
            make.size.mas_equalTo(CGSizeMake(38, 44));
            make.right.equalTo(whiteView);
        }];
        _rightImageView.contentMode = UIViewContentModeCenter;
        _rightImageView.image = [UIImage imageNamed:@"next_light"];
        
        _titleLabel = [UILabel new];
        [whiteView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftImageView.mas_right);
            make.right.equalTo(_rightImageView.mas_left);
            make.centerY.equalTo(whiteView);
        }];
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}

@end
