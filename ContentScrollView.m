//
//  ContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollView.h"


@interface ContentScrollView ()

@end
@implementation ContentScrollView

//创建滚动广告视图
- (LFLoopScrollView *)adScrollView{
    if (nil == _adScrollView) {
        LFLoopScrollView *adScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        adScrollView.autoScroll = YES;
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;

        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}


//创建条件选择器
- (ChooserView *)chooserView{
    if (nil == _chooserView) {
        NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
        ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, CGRectGetMaxY(self.adScrollView.frame))];
        [chooserView setTitlesOfButtonWith:buttonTitles];
        [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
        _chooserView = chooserView;
        [self addSubview:chooserView];
    }
    return _chooserView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.adScrollView setImageWithUrlS:urls];

    [self.chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
}

- (void)setValueWith:(id)data{
    
}
@end