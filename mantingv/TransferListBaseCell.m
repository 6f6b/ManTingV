//
//  TransferListBaseCell.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferListBaseCell.h"

@implementation TransferListBaseCell

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.roomNumber removeFromSuperview];
    [self.roomNumberLabel removeFromSuperview];
    [self.cycleLabel removeFromSuperview];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
}

@end
