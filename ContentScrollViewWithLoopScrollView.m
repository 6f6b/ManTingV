//
//  ContentScrollViewWithLoopScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"

@implementation ContentScrollViewWithLoopScrollView

//创建滚动广告视图
- (LFLoopScrollViewForMT *)adScrollView{
    if (nil == _adScrollView) {
        LFLoopScrollViewForMT *adScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        adScrollView.autoScroll = YES;
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;
        
        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}

@end
