//
//  ContentScrollViewWithLoopScrollViewAndChooserView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"
#import "LFChooserView.h"

@interface ContentScrollViewWithLoopScrollViewAndChooserView : ContentScrollViewWithLoopScrollView<LFChooserViewDelegate>
@property (nonatomic,weak) LFChooserView *chooserView;
@property (nonatomic,strong) NSArray *chooserViewDataArray;
@end
