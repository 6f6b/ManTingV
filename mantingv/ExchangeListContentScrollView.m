//
//  ExchangeListContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeListContentScrollView.h"
#import "ExchangeListBaseCell.h"
#import "ExchangeDetailController.h"

@implementation ExchangeListContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSArray *buttonTitles = @[@"选择目的地",@"选择度假屋",@"周次"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];
}

- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        CGFloat X = 0;
        CGFloat Y = CGRectGetMaxY(self.chooserView.frame)+100*i;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 90;
        ExchangeListBaseCell *exchangeListBaseCell = [[ExchangeListBaseCell alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        exchangeListBaseCell.backgroundColor = [UIColor greenColor];
        [self addSubview:exchangeListBaseCell];
        exchangeListBaseCell.tag = 100+i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [exchangeListBaseCell addGestureRecognizer:tap];
        
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(exchangeListBaseCell.frame));
    }
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    ExchangeDetailController *exchangeDetailController = [[ExchangeDetailController alloc] init];
    exchangeDetailController.title = [NSString stringWithFormat:@"%lu",tap.view.tag];
    [self.controller.navigationController pushViewController:exchangeDetailController animated:YES];
}
@end
