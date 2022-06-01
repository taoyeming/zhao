//
//  ZHUserCenterHeaderTableViewCell.m
//  zhao
//
//  Created by taoyeming on 2022/5/29.
//

#import "ZHUserCenterHeaderTableViewCell.h"

@interface ZHUserCenterHeaderTableViewCell()

@end

@implementation ZHUserCenterHeaderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        _iconImageView = [UIImageView new];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(90, 90));
            make.top.equalTo(self.contentView).offset(18);
        }];
        _iconImageView.layer.cornerRadius = 25;
        _iconImageView.clipsToBounds = YES;
        
        _nameLabel = [UILabel new];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(_iconImageView.mas_bottom).offset(8);
            make.height.equalTo(@34);
        }];
        _nameLabel.font = [ZHFont normalMisansFontOfSize:26];
        _nameLabel.textColor = [ZHColor colorWithHex:@"#222227"];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        
        _phoneLabel = [UILabel new];
        [self.contentView addSubview:_phoneLabel];
        [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(_nameLabel.mas_bottom).offset(1);
            make.height.equalTo(@24);
            make.bottom.equalTo(self.contentView).offset(-29);
        }];
        _phoneLabel.font = [ZHFont lightMisansFontOfSize:18];
        _phoneLabel.textColor = [ZHColor colorWithHex:@"#727277"];
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

@end
