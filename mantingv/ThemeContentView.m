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
    MTModel *model = [MTModel modelWithDictionary:data];
    ;
    NSArray *arr = (NSArray *)model.data;
    for (int i=0; i<arr.count; i++) {
        Theme *theme = [[Theme alloc] init];
        theme.controller = self.controller;
        theme.layer.cornerRadius = 5;
        theme.clipsToBounds = YES;
        theme.tag = 1000+i;
        CGFloat X = i%2*(SCREEN_WIDTH/2+10);
        CGFloat Y = i/2*(SCREEN_WIDTH/2);
        CGFloat W = (SCREEN_WIDTH/2);
        CGFloat H = SCREEN_WIDTH/2-10;
        theme.frame = CGRectMake(X, Y, W, H);
        [self addSubview:theme];
        

        CGRect frame = self.frame;
        frame.size.width = SCREEN_WIDTH;
        frame.size.height = CGRectGetMaxY(theme.frame);
        
        self.frame = frame;
        [theme setValueWith:model.data[i]];
    }
}

- (void)dealThemeTap:(UITapGestureRecognizer *)tap{
    NSLog(@"oh shit");
    UIView *view = tap.view;
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    themeListController.title = [NSString stringWithFormat:@"%lu",view.tag];
    
    MTBaseScrollView *homeContentScrollView = (MTBaseScrollView *)self.superview;
    
    [homeContentScrollView.controller.navigationController pushViewController:themeListController animated:YES];
}
@end
