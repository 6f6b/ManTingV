//
//  MyHouseListCell.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyHouseListCell.h"

@implementation MyHouseListCell

- (void)awakeFromNib {
    // Initialization code
    self.backImage.clipsToBounds = YES;
    self.backImage.layer.cornerRadius = 3;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
