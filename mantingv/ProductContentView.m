//
//  ProductContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/24.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContentView.h"
#import "ProductContainView.h"
#import "HolidayHouseSearchController.h"

@implementation ProductContentView

- (void)setValueWith:(id)data{
    MTModel *model = [MTModel modelWithDictionary:data];
    NSArray *arr = model.data;
        ProductContainView *previewsProductContainView;
        for (int i=0; i<arr.count; i++) {
            CGFloat productViewX = 0;
            CGFloat productViewY = CGRectGetMaxY(previewsProductContainView.frame)+11;
            
            ProductContainView *productContainView = [ProductContainView choiceNessViewWithPoint:CGPointMake(productViewX, productViewY)];
            productContainView.backgroundColor = [UIColor whiteColor];
            productContainView.controller = self.controller;

            previewsProductContainView = productContainView;
            [self addSubview:productContainView];
            [productContainView setValueWith:arr[i]];
    
            //调整自身frame
            CGRect frame = self.frame;
            frame.size.height = CGRectGetMaxY(productContainView.frame);
            self.frame = frame;
        }
    UIScrollView *scroll = (UIScrollView *)self.superview;
    scroll.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

@end
