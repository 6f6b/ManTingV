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
    switchView.frame = CGRectMake(0, 64, ScreenWidth, 40);
    NSLog(@"%@",switchView);
    [switchView setTitles:titles];
    return switchView;
}

- (void)setClickedAction:(void (^)(NSInteger))action{
    _action = action;
}

- (void)setTitles:(NSArray *)titles{
    for (int i; i<titles.count; i++) {
        CGFloat X = (ScreenWidth/titles.count)*i;
        CGFloat Y = 0;
        CGFloat W = ScreenWidth/titles.count;
        CGFloat H = 40;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor greenColor];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(X, Y, W, H);
        [button addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }

}

- (void)dealBtn:(UIButton *)button{
    if (self.action) {
        self.action(button.tag);
    }
}
@end
