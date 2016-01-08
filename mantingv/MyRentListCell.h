//
//  MyRentListCell.h
//  mantingv
//
//  Created by LiuFeng on 16/1/8.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRentListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
