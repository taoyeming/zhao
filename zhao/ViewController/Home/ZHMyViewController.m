//
//  ZHMyViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHMyViewController.h"
#import "ZHMyTableViewCell.h"
#import "ZHMyInfoTableViewCell.h"
#import "ZHUserManager.h"

typedef NS_ENUM(NSUInteger, ZHMyViewControllerCellType) {
    ZHMyViewControllerCellTypeInfo = 0,
    ZHMyViewControllerCellTypeAuth = 1,
    ZHMyViewControllerCellTypeSetting = 2,
    ZHMyViewControllerCellTypeAll = 7,
};

@interface ZHMyViewController()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<NSString *> *buttons;

@end

@implementation ZHMyViewController

#pragma mark - Life crycle

- (instancetype)init {
    self = [super init];
    if(self) {
        self.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_my"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navView.hidden = YES;
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[ZHMyInfoTableViewCell class] forCellReuseIdentifier:@"ZHMyInfoTableViewCell"];
    [_tableView registerClass:[ZHMyTableViewCell class] forCellReuseIdentifier:@"ZHMyTableViewCell"];
    _tableView.estimatedRowHeight = 300;
    
    self.view.backgroundColor = [ZHColor colorWithHex:@"#F2F2F2"];
    
    [self addAction];
}

#pragma mark - Private method

- (void)addAction {
    @weakify(self);
    // 如果用户名、手机号、头像修改则刷新
    [[RACSignal combineLatest:@[
            RACObserve(ZHUserManager.shared, nickName),
            RACObserve(ZHUserManager.shared, phone),
            RACObserve(ZHUserManager.shared, header),
        ]reduce:^(NSString *phone){
            return @(YES);
    }] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

#pragma mark - TableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == ZHMyViewControllerCellTypeInfo) {
        ZHMyInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHMyInfoTableViewCell"];
        cell.phoneLabel.text = [ZHUserManager shared].phone;
        cell.nameLabel.text = [ZHUserManager shared].nickName;
        [cell.nameLabel sizeToFit];
        return cell;
    } else {
        ZHMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZHMyTableViewCell"];
        cell.titleLabel.text = @"测试";
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case ZHMyViewControllerCellTypeInfo: {
            [ZHRoute openUserCenter];
        }
    }
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return ZHMyViewControllerCellTypeAll;
}

@end
