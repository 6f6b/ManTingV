//
//  UINavigationBar+LF.m
//  NavigationBar颜色渐变
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 LF. All rights reserved.
//

#import "UINavigationBar+LF.h"
#import <objc/runtime.h>

static char key;
@implementation UINavigationBar (LF)

- (UIView *)backgroundView{
    return objc_getAssociatedObject(self, &key);
}

- (void)setBackgroundView:(UIView *)backgroundView{
    objc_setAssociatedObject(self, &key, backgroundView, OBJC_ASSOCIATION_ASSIGN);
}

- (void)setShadowColor:(UIColor *)backgroundColor{
    //使navigationbar透明
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //使navigationbar去除分割线
    [self setShadowImage:[UIImage new]];
    //为navigationbar插入一个view用于改变颜色
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.frame.size.width, 64)];
    self.backgroundView = backgroundView;
    self.backgroundView.alpha = 0;
    backgroundView.backgroundColor = [UIColor blueColor];
    [self insertSubview:backgroundView atIndex:0];
}
@end
