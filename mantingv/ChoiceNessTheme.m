//
//  ChoiceNessTheme.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceNessTheme.h"
#import "ChoiceTheme.h"
#import "ChoiceThemeModel.h"

#import "HolidayHouseSearchController.h"
@implementation ChoiceNessTheme

- (void)setValueWith:(id)data{
    MTModel *model = [MTModel modelWithDictionary:data];
    NSArray *arr = model.data;
    for(int i=0;i<arr.count;i++){
        ChoiceTheme *choiceTheme = [[ChoiceTheme alloc] init];
        choiceTheme.backgroundColor = [UIColor brownColor];
        choiceTheme.layer.cornerRadius = 5;
        choiceTheme.clipsToBounds = YES;
        choiceTheme.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [choiceTheme addGestureRecognizer:tap];
        
        float X = 0;
        float Y = 30+155*i;
        float W = SCREEN_WIDTH;
        float H = 150;
        choiceTheme.frame = CGRectMake(X, Y, W, H);
        [self addSubview:choiceTheme];
        [choiceTheme setValueWith:arr[i]];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceTheme.frame));
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    NSLog(@"<------->%f",CGRectGetMaxY(self.frame));
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    HolidayHouseSearchController *holidayHouseSearchController = [[HolidayHouseSearchController alloc] init];
    
    MTBaseScrollView *contentScrollView = self.superview;
    [contentScrollView.controller.navigationController pushViewController:holidayHouseSearchController animated:YES];
}
@end
