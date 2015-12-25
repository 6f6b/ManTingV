//
//  ChoiceNessView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ChoiceNessView : MTBaseView

//创建视图对象
+ (instancetype)choiceNessViewWithPoint:(CGPoint)point;

//设置“查看更多”的点击事件
- (void)setClickedAction:(void(^)())action;

- (void)setTitle:(NSString *)title;

//在setValue中自定义创建子视图
@end
