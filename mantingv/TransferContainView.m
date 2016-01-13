//
//  TransferContainView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/12.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "TransferContainView.h"
#import "TransferView.h"

@implementation TransferContainView

- (void)setValueWith:(id)data{
    NSArray *arr = data;
    for (int i =0; i<arr.count; i++) {
        CGFloat X = 0;
        CGFloat Y = 100*i+10;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 90;
        TransferView *transferView = [[TransferView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        transferView.controller = self.controller;
        transferView.backgroundColor = [UIColor greenColor];
        [transferView setValueWith:arr[i]];
        [self addSubview:transferView];
        
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(transferView.frame);
        self.frame = frame;
    }
}

@end
