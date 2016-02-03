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
        CGFloat Y = 71*i;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 70;
        themeListView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:themeListView];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:model.houseWeekDTOs[i]];
        [dic setValue:model.buildingTypeArea forKey:@"buildingTypeArea"];
        [dic setValue:model.imageGuids[i] forKey:@"imageUrl"];
        [dic setValue:model.houseType forKey:@"houseType"];
        [dic setValue:model.name forKey:@"title"];
        
        [themeListView setValueWith:dic];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, SCREEN_WIDTH, CGRectGetMaxY(themeListView.frame));
    }
}

@end
