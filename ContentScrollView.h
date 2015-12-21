//
//  ContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"
#import "ChooserView.h"

@interface ContentScrollView : MTBaseScrollView
@property (nonatomic,weak) ChooserView *chooserView;
@property (nonatomic,weak) LFLoopScrollView *adScrollView;
@end
