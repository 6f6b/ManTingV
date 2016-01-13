//
//  ExchangeContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/30.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeContentScrollView.h"
#import "ExchangeContainView.h"

@interface ExchangeContentScrollView ()
@property (nonatomic,weak) ExchangeContainView *exchangeContainView;
@end
@implementation ExchangeContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.appendingUrl = @"/exchange/list";
}

- (ExchangeContainView *)exchangeContainView{
    if (nil == _exchangeContainView) {
        ExchangeContainView *exchangeContainView = [[ExchangeContainView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 10)];
        exchangeContainView.controller = self.controller;
        [self addSubview:exchangeContainView];
        _exchangeContainView = exchangeContainView;
    }
    return _exchangeContainView;
}




- (void)setValueWith:(id)data{
    if (nil == data) {
       [self loadDataFromServer];
    }
    NSLog(@"Value");
    [self.exchangeContainView removeFromSuperview];
    self.exchangeContainView = nil;
    [self.exchangeContainView setValueWith:data];
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.exchangeContainView.frame));
}

@end
