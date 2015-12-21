//
//  TransferContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferContentScrollView.h"
#import "TransferListBaseCell.h"
#import "TransferDetailController.h"

@interface TransferContentScrollView ()
@end
@implementation TransferContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    [self.chooserView setTitlesOfButtonWith:@[@"地点",@"度假屋",@"周次"]];
}

- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        CGFloat X = 0;
        CGFloat Y = CGRectGetMaxY(self.chooserView.frame)+100*i+10;
        CGFloat W = ScreenWidth;
        CGFloat H = 90;
        TransferListBaseCell *transferListBaseCell = [[TransferListBaseCell alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        transferListBaseCell.backgroundColor = [UIColor greenColor];
        [self addSubview:transferListBaseCell];
        transferListBaseCell.tag = 100+i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [transferListBaseCell addGestureRecognizer:tap];
        
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(transferListBaseCell.frame));
    }
    
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    TransferDetailController *transferDetailController = [[TransferDetailController alloc] init];
    transferDetailController.title = [NSString stringWithFormat:@"%lu",tap.view.tag];
    [self.controller.navigationController pushViewController:transferDetailController animated:YES];
}
@end
