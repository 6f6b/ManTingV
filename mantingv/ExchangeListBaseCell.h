//
//  ExchangeListBaseCell.h
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ExchangeListBaseCell : MTBaseView
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *roomNumberLabel;
@property (nonatomic,weak) UILabel *roomNumber;
@property (nonatomic,weak) UILabel *cycleLabel;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *exchangeNumberOfDaysLabel;
@property (nonatomic,weak) UILabel *addressLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@end
