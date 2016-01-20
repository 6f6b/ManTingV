//
//  LFChooserView.h
//  LFChooserViewDemo
//
//  Created by LiuFeng on 16/1/20.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LFChooserViewDelegate <NSObject>
- (void)chooserViewDidSelectColumnAtIndex:(NSInteger)index RowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface LFChooserView : UIView<UITabBarDelegate>
@property (nonatomic,copy) NSArray *cellTitles;
@property (nonatomic,strong) id <LFChooserViewDelegate> delegate;

//创建选择器对象
+ (instancetype)shareChooserViewWith:(CGFloat)y;

//设置button的title
- (void)setTitlesOfButtonWith:(NSArray *)titles;

//为设置tableView的数组,一般是一个二维数组
- (void)setCellTitlesWith:(NSArray *)cellTitles;

@end
