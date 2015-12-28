//
//  ContentScrollViewWithLoopScrollViewAndChooserView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"
#import "ChooserView.h"

@interface ContentScrollViewWithLoopScrollViewAndChooserView : ContentScrollViewWithLoopScrollView
@property (nonatomic,weak) ChooserView *chooserView;
@end
