//
//  ThemeScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/9.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeScrollView.h"
#import "Theme.h"
#import "ThemeListController.h"
#import "ContentScrollView.h"

@interface ThemeScrollView ()
@property (nonatomic,strong) NSMutableArray *thems;
@end
@implementation ThemeScrollView


- (void)setValueWithModel:(MTModel *)model{
    for (int i; i<10; i++) {
        Theme *theme = [[Theme alloc] init];
        theme.tag = 1000+i;
        CGFloat X = i*(ScreenWidth-10*3)/2+10;
        CGFloat Y = 5;
        CGFloat W = (ScreenWidth-10*3)/2-20;
        CGFloat H = self.frame.size.height-10;
        theme.frame = CGRectMake(X, Y, W, H);
        [self addSubview:theme];
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealThemeTap:)];
        [theme addGestureRecognizer:tap];
        
        self.contentSize = CGSizeMake(CGRectGetMaxX(theme.frame), 0);
    }
    
}

- (void)dealThemeTap:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    NSLog(@"%lu",view.tag);
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    themeListController.title = [NSString stringWithFormat:@"%lu",view.tag];
    
    ContentScrollView *contentScrollView = self.superview;
    [contentScrollView.homeController.navigationController pushViewController:themeListController animated:YES];
}
@end
