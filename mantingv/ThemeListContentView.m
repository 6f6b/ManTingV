//
//  ThemeListContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListContentView.h"
#import "ThemeListView.h"

@implementation ThemeListContentView

//创建的同时赋值
- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        ThemeListView *themeListView = [[ThemeListView alloc] init];
        [themeListView setValueWith:nil];
        themeListView.tag = 100+i;
        themeListView.backgroundColor = [UIColor blueColor];
        
        CGFloat X = 0;
        CGFloat Y = 82*i;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 80;
        themeListView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:themeListView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, SCREEN_WIDTH, CGRectGetMaxY(themeListView.frame));
    }
}

@end
