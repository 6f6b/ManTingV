//
//  LFSelectionView.h
//  LFSelectionView
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeclectionViewDelegate<NSObject>
- (void)selectView:(UIView *)selectView;
@end

@interface LFSelectionView : UIView
@property (nonatomic,strong) id<SeclectionViewDelegate> delegate;
+ (instancetype)selectionViewWithOrigin:(CGPoint)origin;
- (void)setTitlesWith:(NSArray *)titles;
- (void)setViewWith:(NSArray *)views;
@end
