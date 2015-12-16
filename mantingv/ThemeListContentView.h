//
//  ThemeListContentView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThemeListContentView : UIView
@property (nonatomic,strong) UIViewController *controller;
- (void)setValueWithModel:(MTModel *)model;
@end
