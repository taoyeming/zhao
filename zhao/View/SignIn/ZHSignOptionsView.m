//
//  ZHSignOptionsView.m
//  zhao
//
//  Created by taoyeming on 2022/5/15.
//

#import "ZHSignOptionsView.h"
#import "ZHColor.h"

@interface ZHSignOptionsView()

@property (nonatomic, strong) NSArray<UIView *> *gapViews;

@property (nonatomic, strong) NSArray<UIButton *> *buttons;

@end

@implementation ZHSignOptionsView

- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = [titles copy];
    for (UIButton *button in self.buttons) {
        [button removeFromSuperview];
    }
    for (UIView *gapView in self.gapViews) {
        [gapView removeFromSuperview];
    }
    
    NSMutableArray<UIButton *> *buttons = [NSMutableArray new];
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        UIButton *button = [UIButton new];
        [self addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[ZHColor blueColor] forState:UIControlStateNormal];
        [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [button setTag:i];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [buttons addObject:button];
    }
    NSMutableArray<UIView *> *gapViews = [NSMutableArray new];
    for (int i = 1; i < buttons.count; i ++) {
        UIView *gapView = [UIView new];
        gapView.backgroundColor = [ZHColor blueColor];
        [self addSubview:gapView];
        [gapViews addObject:gapView];
    }
    self.buttons = [buttons copy];
    self.gapViews = [gapViews copy];
    
    [self resizeAllButtons];
}

- (void)resizeAllButtons {
    if(self.buttons.count < 1)
        return;
    CGFloat buttonWidth = self.frame.size.width / self.buttons.count;
    CGFloat buttonHeight = self.frame.size.height;
    for (int i = 0; i < self.buttons.count; i ++) {
        UIButton *button = self.buttons[i];
        button.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHeight);
    }
    
    for (int i = 0; i < self.gapViews.count; i ++) {
        UIView *gapView = self.gapViews[i];
        CGFloat gapHeight = 6;
        CGFloat y = (buttonHeight - gapHeight) / 2.0;
        gapView.frame = CGRectMake(i * buttonWidth + buttonWidth, y , 1, gapHeight);
    }
}

- (void)clickButton:(UIButton *)button {
    [self.delegate signOptionsViewDelegateClickWithIndex:button.tag title:self.titles[button.tag]];
}

- (void)layoutSubviews {
    [self resizeAllButtons];
}

@end
