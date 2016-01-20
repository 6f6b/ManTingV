//
//  ContentScrollViewWithChooserView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BaseContentScrollView.h"
#import "LFChooserView.h"

@interface ContentScrollViewWithChooserView : BaseContentScrollView<LFChooserViewDelegate>
@property (nonatomic,weak) LFChooserView *chooserView;
@property (nonatomic,strong) NSMutableArray *chooserViewDataArray;
@end
