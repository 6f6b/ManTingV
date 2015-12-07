//
//  ContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollView.h"

@implementation ContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    float adsX = 0;
    float adsY = 0;
    float adsW = self.frame.size.width;
    float adsH = 150;
    self.adScrollView.frame = CGRectMake(adsX, adsY, adsW, adsH);
    
//    self.adPageControl.center = self.center;
//    float adpX = self.adPageControl.frame.origin.x;
//    float adpY = CGRectGetMaxY(self.adScrollView.frame)-20;
//    float adpW = 20;
//    float adpH = 100;
//    self.adPageControl.frame = CGRectMake(adpX, adpY, adpW, adpH);
    
}

- (UIScrollView *)adScrollView{
    if (nil == _adScrollView) {
        UIScrollView *adScrollView = [[UIScrollView alloc] init];
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;
        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}

//- (UIPageControl *)adPageControl{
//    if (nil == _adPageControl) {
//        UIPageControl *adPageControl = [[UIPageControl alloc] init];
//        adPageControl.backgroundColor = [UIColor redColor];
//        adPageControl.numberOfPages = 4;
//        _adPageControl = adPageControl;
//        [self addSubview:_adPageControl];
//    }
//    return _adPageControl;
//}


- (void)setButtons{
    NSArray *titles = @[@"认购",@"交换",@"转让",@"入住"];
    NSArray *images = @[];
    for (int i=0; i<4; i++) {
//        float btnX = Screenheight
//        float btnY =
//        float btnW =
//        float btnH =
    }
}

- (void)setButtonWithImage:(UIImage *)image frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)dealButton:(UIButton *)button{
    
}

- (UIButton *)subscription{
    if (_subscription == nil) {
        UIButton *subscription = [[UIButton alloc] init];
        _subscription = subscription;
        [self addSubview:_subscription];
    }
    return _subscription;
}

- (UIButton *)exchange{
    if (_exchange == nil) {
        UIButton *exchange = [[UIButton alloc] init];
        _exchange = exchange;
        [self addSubview:_exchange];
    }
    return _exchange;
}

- (UIButton *)assignment{
    if (_assignment == nil) {
        UIButton *assignment = [[UIButton alloc] init];
        _assignment = assignment;
        [self addSubview:_assignment];
    }
    return _assignment;
}

- (UIButton *)checkInto{
    if (_checkInto == nil) {
        UIButton *checkInto = [[UIButton alloc] init];
        _checkInto = checkInto;
        [self addSubview:_checkInto];
    }
    return _checkInto;
}

@end
