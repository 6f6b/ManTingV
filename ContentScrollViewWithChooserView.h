//
//  ContentScrollViewWithChooserView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BaseContentScrollView.h"
#import "ChooserView.h"

@interface ContentScrollViewWithChooserView : BaseContentScrollView
@property (nonatomic,weak) ChooserView *chooserView;
@property (nonatomic,strong) NSMutableArray *chooserViewDataArray;
@end
