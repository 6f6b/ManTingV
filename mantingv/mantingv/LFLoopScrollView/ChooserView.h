//
//  ChooserView.h
//  test
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ChooserView : MTBaseView

//点击事件
- (void)setClickedAction:(void(^)(NSInteger indexOfDataAndButtons,NSIndexPath *indexPath))action;

//创建选择器对象
+ (instancetype)shareChooserViewWith:(CGPoint)origin;

//设置button的title
- (void)setTitlesOfButtonWith:(NSArray *)titles;

//为设置tableView的数组,一般是一个二维数组
- (void)setDataArraysWith:(NSArray *)dataContentArray;
@end
