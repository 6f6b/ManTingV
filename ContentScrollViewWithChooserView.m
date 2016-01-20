//
//  ContentScrollViewWithChooserView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithChooserView.h"

@implementation ContentScrollViewWithChooserView

//创建条件选择器
- (LFChooserView *)chooserView{
    if (nil == _chooserView) {
        LFChooserView *chooserView = [LFChooserView shareChooserViewWith:0];
        _chooserView = chooserView;
        chooserView.delegate = self;
        [self addSubview:chooserView];
    }
    return _chooserView;
}

- (void)chooserViewDidSelectColumnAtIndex:(NSInteger)index RowAtIndexPath:(NSIndexPath *)indexPath{

}
@end
