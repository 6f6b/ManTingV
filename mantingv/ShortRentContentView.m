//
//  ShortRentContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentContentView.h"
#import "ShortRentView.h"

@implementation ShortRentContentView

- (void)setValueWith:(id)data{
    NSArray *arr = data;
    for (int i=0; i<arr.count; i++) {
        CGFloat X = 0;
        CGFloat Y = i*101+1;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 100;
        ShortRentView *shortRentView = [[ShortRentView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [shortRentView setValueWith:arr[i]];
        shortRentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:shortRentView];
        shortRentView.controller = self.controller;
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(shortRentView.frame);
        self.frame = frame;
    }
    UIScrollView *shortRentContentScrollView = (UIScrollView *)self.superview;
    shortRentContentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

@end
