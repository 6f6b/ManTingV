//
//  ThemeListContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListContentView.h"
#import "ThemeListView.h"
#import "ThemeListContentScrollViewModel.h"

@implementation ThemeListContentView

//创建的同时赋值
- (void)setValueWith:(id)data{
    ThemeListContentScrollViewModel *model = data;
    for (int i=0; i<model.houseWeekDTOs.count; i++) {
        ThemeListView *themeListView = [[ThemeListView alloc] init];
        themeListView.controller = self.controller;
        themeListView.tag = 100+i;
        themeListView.backgroundColor = [UIColor whiteColor];
        
        CGFloat X = 0;
        CGFloat Y = 82*i;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 80;
        themeListView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:themeListView];
        themeListView.buildingSize = model.buildingTypeArea;
        themeListView.imageUrl = model.imageGuids[i];
        themeListView.houseType = model.houseType;
        [themeListView setValueWith:model.houseWeekDTOs[i]];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, SCREEN_WIDTH, CGRectGetMaxY(themeListView.frame));
    }
}

@end
