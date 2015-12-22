//
//  LFSelectionView.m
//  LFSelectionView
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "LFSelectionView.h"

@interface LFSelectionView ()
@property (nonatomic,strong) NSArray *views;
@property (nonatomic,strong) NSMutableArray *buttons;
@end
@implementation LFSelectionView

+ (instancetype)selectionViewWith:(NSArray *)titles views:(NSArray *)views origin:(CGPoint)origin{
    LFSelectionView *selectionView = [[LFSelectionView alloc] initWithFrame:CGRectMake(origin.x, origin.y, SCREEN_WIDTH, 40)];
    
    selectionView.buttons = [[NSMutableArray alloc] init];
    [selectionView setTitlesWith:titles];
    [selectionView setViewWith:views];
    return selectionView;
}

- (void)setTitlesWith:(NSArray *)titles{
    for (int i=0; i<titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor redColor]];
        button.tag = i;
        [self.buttons addObject:button];
        [self addSubview:button];
        
        float X = SCREEN_WIDTH/titles.count*i;
        float Y = 0;
        float W = SCREEN_WIDTH/titles.count-1;
        float H = 40;
        button.frame = CGRectMake(X, Y, W, H);
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor grayColor]];
        [button addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)setViewWith:(NSArray *)views{
    self.views = [NSArray arrayWithArray:views];
    for (int i=0; i<views.count; i++) {
        UIView *view = views[i];
        CGRect frame = view.frame;
        frame.origin.x = 0;
        frame.origin.y = 40;
        frame.size.width = SCREEN_WIDTH;
        view.frame = frame;
        
        CGRect selfFrame = self.frame;
        selfFrame.size.height = 40+frame.size.height;
        self.frame = selfFrame;
        
        [self addSubview:view];

    }
    [self dealBtn:self.buttons[0]];
}

- (void)dealBtn:(UIButton *)button{
/////////////////显示view////////////////////////////
    for (UIView *view in self.views){
        view.hidden = YES;
    }
    UIView *view = self.views[button.tag];
    view.hidden = NO;
    
/////////////////调节自身frame////////////////////////////
    CGRect frame = self.frame;
    frame.size.height = 40+view.frame.size.height;
    self.frame = frame;
    
/////////////////调节button选中状态////////////////////////////
    for(UIButton *button in self.buttons){
        button.selected = NO;
    }
    button.selected = YES;

    
/////////////////代理调节frame////////////////////////////
    [self.delegate selectView:self];
}
@end
