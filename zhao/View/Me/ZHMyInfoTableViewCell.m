//
//  ZHMyInfoTableViewCell.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHMyInfoTableViewCell.h"

@implementation ZHMyInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        _iconImageView = [UIImageView new];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(34);
            make.top.equalTo(self.contentView).offset(84);
            make.bottom.equalTo(self.contentView).offset(-65);
            make.size.mas_equalTo(CGSizeMake(81, 81));
        }];
        _iconImageView.clipsToBounds = YES;
        _iconImageView.layer.cornerRadius = 10;
        _iconImageView.image = [UIImage imageNamed:@"defaultIcon"];
        
        _nameLabel = [UILabel new];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(22);
            make.top.equalTo(self.iconImageView).offset(4);
            make.height.equalTo(@(38));
            make.right.lessThanOrEqualTo(self.contentView).offset(-88);
        }];
        _nameLabel.font = [ZHFont normalMisansFontOfSize:26];
        _nameLabel.textColor = [ZHColor colorWithHex:@"#222227"];
        
//        _safeImageView = [UIImageView new];
//        [self.contentView addSubview:_safeImageView];
//        [_safeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(12, 15));
//            make.left.equalTo(_nameLabel.mas_right).offset(7);
//            make.bottom.equalTo(_nameLabel).offset(-7);
//        }];
//        _safeImageView.image = [UIImage imageNamed:@"safe"];
//
        _phoneLabel = [UILabel new];
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel);
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.height.equalTo(@(24));
            make.width.mas_lessThanOrEqualTo(300);
        }];
        _phoneLabel.font = [ZHFont lightMisansFontOfSize:18];
        _phoneLabel.textColor = [ZHColor colorWithHex:@"#727277"];
        
        _rightImageView = [UIImageView new];
        [self.contentView addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-34);
            make.size.mas_equalTo(CGSizeMake(8, 14));
            make.bottom.equalTo(_iconImageView).offset(-11);
        }];
        _rightImageView.image = [UIImage imageNamed:@"next"];
        
        _qrcodeImageView = [UIImageView new];
        [self.contentView addSubview:_qrcodeImageView];
        [_qrcodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_rightImageView.mas_left).offset(-12);
            make.centerY.equalTo(_rightImageView);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        _qrcodeImageView.image = [UIImage imageNamed:@"qrcode"];
    }
    return self;
}

@end
