//
//  MTSwitchView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTSwitchView.h"

@interface MTSwitchView ()
@property (nonatomic,strong) void(^action)(NSInteger index);
@end
@implementation MTSwitchView

+ (instancetype)switchViewWithTitles:(NSArray *)titles{
    MTSwitchView *switchView = [[MTSwitchView alloc] init];
    switchView.backgroundColor = [UIColor redColor];
    switchView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
    [switchView setTitles:titles];
    return switchView;
}

- (void)setClickedAction:(void (^)(NSInteger))action{
    _action = action;
    UIButton *button = [self viewWithTag:1000];
    [self dealBtn:button];
}

- (void)setTitles:(NSArray *)titles{
    for (int i=0; i<titles.count; i++) {
        CGFloat X = (SCREEN_WIDTH/titles.count)*i;
        CGFloat Y = 0;
        CGFloat W = SCREEN_WIDTH/titles.count;
        CGFloat H = 40;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor greenColor];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.tag = 1000+i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(X, Y, W, H);
        [button addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"--->%@",button);
        [self addSubview:button];
    }
}

- (void)dealBtn:(UIButton *)button{
    NSArray *buttons = self.subviews;
    for (int i=0; i<buttons.count; i++) {
        UIButton *button = buttons[i];
        button.selected = NO;
    }
    button.selected = YES;
    if (self.action) {
        self.action(button.tag);
    }
}
@end
