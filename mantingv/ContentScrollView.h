//
//  ContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"
#import "LFLoopScrollView.h"

#import "ChoiceNessRoom.h"
#import "ChoiceNessTheme.h"

@interface ContentScrollView : UIScrollView
@property (nonatomic,weak) HomeController *homeController;
@property (nonatomic,weak) LFLoopScrollView *adScrollView;

@property (nonatomic,strong) NSMutableArray * fourButtons;
@property (nonatomic,weak) ChoiceNessTheme *choiceNessTheme;
@property (nonatomic,weak) ChoiceNessRoom *choiceNessRoom;
@end
