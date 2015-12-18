//
//  MTSwitchView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface MTSwitchView : MTBaseView
+ (instancetype)switchViewWithTitles:(NSArray *)titles;

//设置点击事件
- (void)setClickedAction:(void(^)(NSInteger index))action;

@end
