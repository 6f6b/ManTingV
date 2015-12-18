//
//  ThemeContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeContentView.h"
#import "ThemeListController.h"
#import "Theme.h"

@implementation ThemeContentView

- (void)setValueWith:(id)data{
    for (int i; i<3; i++) {
        Theme *theme = [[Theme alloc] init];
        theme.tag = 1000+i;
        CGFloat X = i%2*(ScreenWidth/2+10);
        CGFloat Y = i/2*(ScreenWidth/2);
        CGFloat W = (ScreenWidth/2);
        CGFloat H = ScreenWidth/2-10;
        theme.frame = CGRectMake(X, Y, W, H);
        [self addSubview:theme];
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealThemeTap:)];
        [theme addGestureRecognizer:tap];
        
        CGRect frame = self.frame;
        frame.size.width = ScreenWidth;
        frame.size.height = CGRectGetMaxY(theme.frame);
        
        self.frame = frame;
    }
}

- (void)dealThemeTap:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    NSLog(@"%lu",view.tag);
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    themeListController.title = [NSString stringWithFormat:@"%lu",view.tag];
    
    MTBaseScrollView *homeContentScrollView = (MTBaseScrollView *)self.superview;
    [homeContentScrollView.controller.navigationController pushViewController:themeListController animated:YES];
}
@end
