//
//  ContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentScrollView : UIScrollView
@property (nonatomic,weak) UIScrollView *adScrollView;
@property (nonatomic,weak) UIPageControl *adPageControl;
@property (nonatomic,weak) UIButton *subscription;
@property (nonatomic,weak) UIButton *exchange;
@property (nonatomic,weak) UIButton *assignment;
@property (nonatomic,weak) UIButton *checkInto;
@end
