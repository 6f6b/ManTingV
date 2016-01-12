//
//  ExchangeContainView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/12.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ExchangeContainView.h"
#import "ExchangeView.h"
#import "ExchangePoolDTOModel.h"

@implementation ExchangeContainView

- (void)setValueWith:(id)data{
    NSArray *arr = [data objectForKey:@"data"];
    for (int i=0; i<arr.count; i++) {
        CGFloat X = 0;
        CGFloat Y = 100*i+10;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 90;
        
        ExchangeView *exchangeView = [[ExchangeView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [exchangeView setValueWith:arr[i]];
        exchangeView.controller = self.controller;
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(exchangeView.frame);
        self.frame = frame;
        [self addSubview:exchangeView];
    }
}

@end
