//
//  ChoiceNessTheme.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceNessTheme.h"
#import "ChoiceTheme.h"

@implementation ChoiceNessTheme

- (void)setValue{
    for(int i=0;i<5;i++){
        ChoiceTheme *choiceTheme = [[ChoiceTheme alloc] init];
        choiceTheme.backgroundColor = [UIColor brownColor];
        choiceTheme.layer.cornerRadius = 5;
        choiceTheme.clipsToBounds = YES;
        choiceTheme.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [choiceTheme addGestureRecognizer:tap];
        
        float X = 0;
        float Y = 30+155*i;
        float W = ScreenWidth;
        float H = 150;
        choiceTheme.frame = CGRectMake(X, Y, W, H);
        [self addSubview:choiceTheme];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceTheme.frame));
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    
}
@end
