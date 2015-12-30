//
//  ExchangeContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/30.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeContentScrollView.h"
#import "ExchangeView.h"

@implementation ExchangeContentScrollView

- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        CGFloat X = 0;
        CGFloat Y = CGRectGetMaxY(self.chooserView.frame)+100*i+10;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 90;
        
        ExchangeView *exchangeView = [[ExchangeView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [exchangeView setValueWith:nil];
        exchangeView.controller = self.controller;
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(exchangeView.frame));
        [self addSubview:exchangeView];
    }
}

@end
