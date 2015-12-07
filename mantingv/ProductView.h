//
//  ProductView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/6.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductView : UIView
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *seeMoreLabel;
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *priceLabel;
@property (nonatomic,weak) UILabel *locationLabel;
@property (nonatomic,weak) UILabel *seeDetailLabel;
@property (nonatomic,weak) UILabel *descriptionLabel;
- (void)setValue:(id)value forModel:(MTModel *)model;

@end
