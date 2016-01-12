//
//  UINavigationBar+LF.h
//  NavigationBar颜色渐变
//
//  Created by qianfeng on 15/10/10.
//  Copyright (c) 2015年 LF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LF)
@property (nonatomic,weak) UIView *backgroundView;
- (void)setShadowColor:(UIColor *)backgroundColor;
@end
