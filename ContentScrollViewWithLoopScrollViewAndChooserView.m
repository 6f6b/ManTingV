//
//  ContentScrollViewWithLoopScrollViewAndChooserView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollViewAndChooserView.h"

@implementation ContentScrollViewWithLoopScrollViewAndChooserView

//创建条件选择器
- (ChooserView *)chooserView{
    if (nil == _chooserView) {
        ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, CGRectGetMaxY(self.loopScrollView.frame))];
        _chooserView = chooserView;
        [self addSubview:chooserView];
    }
    return _chooserView;
}
@end
