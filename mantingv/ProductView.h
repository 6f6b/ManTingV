//
//  ProductView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ProductView : MTBaseView
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *priceLabel;
//@property (nonatomic,weak) UILabel *houseWeekLabel;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *seeDetailLabel;
@property (nonatomic,weak) UILabel *houseTypeAndSizeLabel;
@end
