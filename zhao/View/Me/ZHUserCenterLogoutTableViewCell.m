//
//  ZHUserCenterLogoutTableViewCell.m
//  zhao
//
//  Created by taoyeming on 2022/5/29.
//

#import "ZHUserCenterLogoutTableViewCell.h"

@interface ZHUserCenterLogoutTableViewCell()

@property (nonatomic, strong) UIView *blueView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZHUserCenterLogoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        
        _blueView = [UIView new];
        [self.contentView addSubview:_blueView];
        [_blueView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(37, 19, 0, 19));
            make.height.equalTo(@56);
        }];
        _blueView.backgroundColor = [ZHColor colorWithHex:@"#3478F6"];
        _blueView.clipsToBounds = YES;
        _blueView.layer.cornerRadius = 7;
        
        _titleLabel = [UILabel new];
        [_blueView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_blueView);
        }];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [ZHFont normalMisansFontOfSize:20];
        _titleLabel.textColor = [ZHColor colorWithHex:@"#FFFFFF"];
        _titleLabel.text = @"退出登录";
        
    }
    return self;
}

@end
