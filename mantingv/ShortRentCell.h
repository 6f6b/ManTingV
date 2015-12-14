//
//  ShortRentCell.h
//  mantingv
//
//  Created by LiuFeng on 15/12/4.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortRentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numOfRoomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *weeklyLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end
