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
#import "Choice.h"

@interface ContentScrollView : UIScrollView
@property (nonatomic,weak) HomeController *homeController;
@property (nonatomic,weak) LFLoopScrollView *adScrollView;

@property (nonatomic,strong) NSMutableArray * fourButtons;
@property (nonatomic,weak) Choice *choiceTheme;
@property (nonatomic,weak) Choice *choiceRoom;
@end
