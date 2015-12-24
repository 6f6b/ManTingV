//
//  ProductContainView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContainView.h"
#import "ProductView.h"
#import "ThemeListController.h"
@implementation ProductContainView

- (void)setValueWith:(id)data{
    NSArray *arr = data;
    for (int i=0; i<arr.count; i++) {
        CGFloat X = 0;
        CGFloat Y = 200*i+40;
        CGFloat W = self.frame.size.width;
        CGFloat H = 190;
        ProductView *productView = [[ProductView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        
        productView.layer.cornerRadius = 5;
        productView.clipsToBounds = YES;
        productView.backgroundColor = [UIColor whiteColor];
        productView.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [productView addGestureRecognizer:tap];
        
        [self addSubview:productView];
        [productView setValueWith:arr[i]];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(productView.frame));
    }
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    
    UIView *view = tap.view;
    
    UIViewController *controller = self.controller;
    [controller.navigationController pushViewController:themeListController animated:YES];
}
@end
