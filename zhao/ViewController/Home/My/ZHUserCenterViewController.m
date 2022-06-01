//
//  ZHUserCenterViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHUserCenterViewController.h"
#import "ZHUserCenterHeaderTableViewCell.h"
#import "ZHUserCenterInfoTableViewCell.h"
#import "ZHUserCenterLogoutTableViewCell.h"

@interface ZHUserCenterViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZHUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.navView.mas_bottom);
    }];
    _tableView.estimatedRowHeight = 40;
    [_tableView registerClass:[ZHUserCenterHeaderTableViewCell class] forCellReuseIdentifier:@"ZHUserCenterHeaderTableViewCell"];
    [_tableView registerClass:[ZHUserCenterInfoTableViewCell class] forCellReuseIdentifier:@"ZHUserCenterInfoTableViewCell"];
    [_tableView registerClass:[ZHUserCenterLogoutTableViewCell class] forCellReuseIdentifier:@"ZHUserCenterLogoutTableViewCell"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    
    self.view.backgroundColor = [ZHColor colorWithHex:@"#F2F2F2"];
    _tableView.backgroundColor = [ZHColor colorWithHex:@"#F2F2F2"];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            ZHUserCenterHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHUserCenterHeaderTableViewCell"];
            cell.iconImageView.image = [ZHUserManager shared].headerImage;
            cell.phoneLabel.text = [ZHUserManager shared].phone;
            cell.nameLabel.text = [ZHUserManager shared].nickName;
            return cell;
            break;
        }
        case 1: {
            ZHUserCenterInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHUserCenterInfoTableViewCell"];
            cell.leftTitle.text = @"昵称";
            cell.rightTitle.text = [ZHUserManager shared].nickName;
            return cell;
        }
        case 2: {
            ZHUserCenterInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHUserCenterInfoTableViewCell"];
            cell.leftTitle.text = @"账号";
            cell.rightTitle.text = [ZHUserManager shared].account;
            return cell;
        }
        case 3:
        case 4:
        case 5:
        case 6:
        {
            ZHUserCenterInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHUserCenterInfoTableViewCell"];
            return cell;
        }
        case 7: {
            ZHUserCenterLogoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHUserCenterLogoutTableViewCell"];
            return cell;
            break;
        }
        default:
            return [UITableViewCell new];
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 7:
            [ZHRoute openSignOutFrom:self];
            break;
    }
}

@end
