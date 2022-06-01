//
//  ZHMessageViewController.m
//  zhao
//
//  Created by taoyeming on 2022/5/22.
//

#import "ZHMessageViewController.h"

@interface ZHMessageViewController()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation ZHMessageViewController

#pragma mark - Life crycle

- (instancetype)init {
    self = [super init];
    if(self) {
        self.title = @"消息";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_message"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _addButton = [UIButton new];
    [self.view addSubview:_addButton];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.navView);
        make.right.equalTo(self.navView).offset(-7);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    [_addButton setImage:[[UIImage imageNamed:@"message_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    _addButton.tintColor = [ZHColor colorWithHex:@"#222227"];
    
    [[_addButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[ZHUserManager shared] logout];
    }];
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.navView.mas_bottom);
    }];
    self.view.backgroundColor = [ZHColor colorWithHex:@"#F2F2F2"];
    _tableView.backgroundColor = [ZHColor colorWithHex:@"#F2F2F2"];
}

@end
