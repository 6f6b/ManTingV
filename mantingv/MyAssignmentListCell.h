//
//  MyAssignmentListCell.h
//  mantingv
//
//  Created by LiuFeng on 16/1/8.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAssignmentListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *headImage;

@property (weak, nonatomic) IBOutlet UIView *titleLabe;
@property (weak, nonatomic) IBOutlet UIView *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *timeLabel;
@end
