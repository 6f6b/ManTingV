//
//  ThemeListView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeListView : UIView
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *sizeLabel;
@property (nonatomic,weak) UILabel *surplusLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@property (nonatomic,weak) UIButton *buyButton;
- (void)setValueWithModel:(MTModel *)model;
- (void)dealBuyBtn;
@end
