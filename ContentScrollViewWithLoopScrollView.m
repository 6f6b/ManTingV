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
- (LFLoopScrollViewForMT *)loopScrollView{
    if (nil == _loopScrollView) {
        LFLoopScrollViewForMT *loopScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        loopScrollView.autoScroll = YES;
        loopScrollView.backgroundColor = [UIColor greenColor];
        _loopScrollView = loopScrollView;
        
        [self addSubview:_loopScrollView];
    }
    return _loopScrollView;
}

@end
