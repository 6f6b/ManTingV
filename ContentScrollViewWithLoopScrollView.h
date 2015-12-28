//
//  ContentScrollViewWithLoopScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BaseContentScrollView.h"
#import "LFLoopScrollViewForMT.h"

@interface ContentScrollViewWithLoopScrollView : BaseContentScrollView
@property (nonatomic,weak) LFLoopScrollViewForMT *adScrollView;
@end
