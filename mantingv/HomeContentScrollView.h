//
//  HomeContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithLoopScrollView.h"
#import "HomeController.h"

#import "LFLoopScrollView.h"
#import "FunctionButtonsView.h"
#import "ChoiceNessRoom.h"
#import "ChoiceNessTheme.h"
#import "SpecialOfferContentView.h"

@interface HomeContentScrollView : ContentScrollViewWithLoopScrollView
@property (nonatomic,strong) NSMutableArray * fourButtons;
@property (nonatomic,weak) FunctionButtonsView *functionButtonsView;
@property (nonatomic,weak) ChoiceNessTheme *choiceNessTheme;
@property (nonatomic,weak) ChoiceNessRoom *choiceNessRoom;
@property (nonatomic,weak) UIImageView *what;
@property (nonatomic,weak) SpecialOfferContentView *specialOfferContentView;

@end

