//
//  MyHouseListDetailContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"
#import "MyHouseListDetailDescriptionView.h"
#import "FunctionButtonsView.h"
@interface MyHouseListDetailContentScrollView : ContentScrollViewWithLoopScrollView<FunctionButtonsViewDelegate>
@property (nonatomic,weak) MyHouseListDetailDescriptionView *myHouseListDetailDescriptionView;
@property (nonatomic,weak) FunctionButtonsView *functionButtonsView;
@end
