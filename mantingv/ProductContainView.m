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
    for (int i=0; i<3; i++) {
        CGFloat X = 0;
        CGFloat Y = 150*i+40;
        CGFloat W = self.frame.size.width;
        CGFloat H = 145;
        ProductView *productView = [[ProductView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        
        [productView setValueWith:nil];
        productView.layer.cornerRadius = 5;
        productView.clipsToBounds = YES;
        productView.backgroundColor = [UIColor whiteColor];
        productView.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [productView addGestureRecognizer:tap];
        
        [self addSubview:productView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(productView.frame));
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    
    UIView *view = tap.view;
    
    UIViewController *controller = self.controller;
    [controller.navigationController pushViewController:themeListController animated:YES];
}
@end
