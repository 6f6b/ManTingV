//
//  ProductContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContentView.h"

@implementation ProductContentView

- (void)setValue{
    for (int i=0; i<4; i++) {
        ProductContentView *productView = [[ProductContentView alloc] init];
        productView.backgroundColor = [UIColor brownColor];
        productView.layer.cornerRadius = 5;
        productView.clipsToBounds = YES;
        productView.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTapChoiceTheme:)];
        [productView addGestureRecognizer:tap];
        
        float X = 0;
        float Y = 30+155*i;
        float W = ScreenWidth;
        float H = 150;
        productView.frame = CGRectMake(X, Y, W, H);
        [self addSubview:productView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(productView.frame));
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

@end
