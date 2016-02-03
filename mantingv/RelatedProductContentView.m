//
//  RelatedProductContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RelatedProductContentView.h"
#import "RelatedProductView.h"

@implementation RelatedProductContentView

- (void)setValueWith:(id)data{
    NSArray *arr = data;
    
    for (int i=0; i<arr.count; i++) {
        CGFloat X = 0;
        CGFloat Y = 71*i;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = 70;
        RelatedProductView *relatedProductView = [[RelatedProductView alloc] init];
        relatedProductView.controller = self.controller;
        [relatedProductView setValueWith:arr[i]];
        relatedProductView.backgroundColor = [UIColor whiteColor];
        relatedProductView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:relatedProductView];
        
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(relatedProductView.frame);
        self.frame =frame;
    }
    UIScrollView *superView = (UIScrollView *)self.superview;
    superView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}


@end
