//
//  RelatedProductsView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RelatedProductsView.h"
#import "RelatedProductView.h"

@implementation RelatedProductsView

- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        CGFloat X = 0;
        CGFloat Y = 87*i;
        CGFloat W = ScreenWidth;
        CGFloat H = 80;
        RelatedProductView *relatedProductView = [[RelatedProductView alloc] init];
        [relatedProductView setValueWith:nil];
        relatedProductView.backgroundColor = [UIColor yellowColor];
        relatedProductView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:relatedProductView];
        
        CGRect frame = self.frame;
        frame.size.height = CGRectGetMaxY(relatedProductView.frame);
        self.frame =frame;
    }
}

@end
