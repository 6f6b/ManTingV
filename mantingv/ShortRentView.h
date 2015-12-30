//
//  ShortRentView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseView.h"

@interface ShortRentView : MTBaseView
@property (weak, nonatomic) UILabel *numOfRoomLabel;
@property (weak, nonatomic) UILabel *numOfRoom;
@property (weak, nonatomic) UIImageView *backImage;

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *houseTypeLabel;
@property (weak, nonatomic) UILabel *weeklyLabel;
@property (weak, nonatomic) UILabel *addressLabel;
@property (weak, nonatomic) UILabel *priceLabel;
@end
