//
//  FunctionButtonsView.h
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
//代理实现button的点击事件
@protocol FunctionButtonsViewDelegate<NSObject>
- (void)clickedAtIndexOfButton:(NSInteger)index;
@end

@interface FunctionButtonsView : UIView
@property (nonatomic,strong) id<FunctionButtonsViewDelegate> delegate;

/**
 *  类方法便捷生成一个模块
 *
 *  @return 返回模块指针
 */
+ (instancetype)functionButtonsViewWithOrigin:(CGPoint)origin;

/**
 *  为模块赋图片以及title，注意images和titles的count要相等
 *
 *  @param images 图片数组
 *  @param titles title数据
 */
- (void)setImages:(NSArray *)images titles:(NSArray *)titles;
@end
