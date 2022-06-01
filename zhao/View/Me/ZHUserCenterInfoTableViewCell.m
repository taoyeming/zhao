//
//  ZHUserCenterInfoTableViewCell.m
//  zhao
//
//  Created by taoyeming on 2022/5/29.
//

#import "ZHUserCenterInfoTableViewCell.h"

@interface ZHUserCenterInfoTableViewCell()

@property (nonatomic, strong) UIView *whiteView;

@end

@implementation ZHUserCenterInfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        _whiteView = [UIView new];
        [self.contentView addSubview:_whiteView];
        [_whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 19, 19, 5));
            make.height.equalTo(@62);
        }];
        _whiteView.backgroundColor = [ZHColor colorWithHex:@"#FFFFFF"];
        _whiteView.clipsToBounds = YES;
        _whiteView.layer.cornerRadius = 10;
        
        UIImageView *nextImageView = [UIImageView new];
        [self.contentView addSubview:nextImageView];
        [nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_whiteView);
            make.right.equalTo(_whiteView.mas_right).offset(-15);
            make.size.mas_equalTo(CGSizeMake(8, 14));
        }];
        nextImageView.image = [[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        nextImageView.tintColor = [ZHColor colorWithHex:@"#D2D2D2"];
        
        _leftTitle = [UILabel new];
        [self.contentView addSubview:_leftTitle];
        [_leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_whiteView);
            make.left.equalTo(_whiteView).offset(16);
            make.width.equalTo(_whiteView).multipliedBy(0.4);
        }];
        _leftTitle.font = [ZHFont lightMisansFontOfSize:20];
        _leftTitle.textColor = [ZHColor colorWithHex:@"#222227"];
        
        _rightTitle = [UILabel new];
        [self.contentView addSubview:_rightTitle];
        [_rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_whiteView);
            make.right.equalTo(nextImageView.mas_left).offset(-7);
            make.width.equalTo(_whiteView).multipliedBy(0.4);
        }];
        _rightTitle.textAlignment = NSTextAlignmentRight;
        _rightTitle.font = [ZHFont lightMisansFontOfSize:18];
        _rightTitle.textColor = [ZHColor colorWithHex:@"#727277"];
        
        
    }
    return self;
}

@end
