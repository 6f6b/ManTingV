//
//  ThemeListView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ThemeListView : MTBaseView
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *sizeLabel;
@property (nonatomic,weak) UILabel *surplusLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@property (nonatomic,weak) UIButton *buyButton;
- (void)dealBuyBtn;
@end
