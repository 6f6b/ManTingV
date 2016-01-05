//
//  FunctionButtonsView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "FunctionButtonsView.h"

@implementation FunctionButtonsView

+ (instancetype)functionButtonsViewWithOrigin:(CGPoint)origin{
    FunctionButtonsView *functionButtonsView = [[FunctionButtonsView alloc] initWithFrame:CGRectMake(origin.x, origin.y, SCREEN_WIDTH, 60)];
    return functionButtonsView;
}

- (void)setImages:(NSArray *)images titles:(NSArray *)titles{
    NSLog(@"设置图片");
    [self setImages:images];
    [self setTitles:titles];
}


- (void)setImages:(NSArray *)images{
    
    for (int i=0; i<images.count; i++) {
        CGFloat X = SCREEN_WIDTH/images.count*i;
        CGFloat Y = 0;
        CGFloat W = SCREEN_WIDTH/images.count;
        CGFloat H = self.frame.size.height-20;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [self addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setTitles:(NSArray *)titles{
    for (int i=0; i<titles.count; i++) {
        CGFloat X = SCREEN_WIDTH/titles.count*i;
        CGFloat Y = self.frame.size.height-20;
        CGFloat W = SCREEN_WIDTH/titles.count;
        CGFloat H = 20;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(X,Y, W, H)];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.text = titles[i];
    }
}
- (void)dealButton:(UIButton *)button{
    [self.delegate clickedAtIndexOfButton:button.tag];
}
@end
