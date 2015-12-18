//
//  ChoiceNessRoom.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceNessRoom.h"
#import "ChoiceRoom.h"
#import "ThemeListController.h"
@implementation ChoiceNessRoom

//+ (instancetype)choiceNessViewWith:(NSString *)title point:(CGPoint)point{
//    CGRect frame = CGRectMake(point.x, point.y, ScreenWidth, Screenheight);
//    ChoiceNessView *choiceNessView = [[ChoiceNessView alloc] initWithFrame:frame];
//    
//    choiceNessView.titleLabel.text = title;
//    choiceNessView.titleLabel.sizeToFit;
//    
//    return choiceNessView;
//}

- (void)setValueWith:(id)data{
    for (int i=0; i<10; i++) {
        float X = i%2*10+(ScreenWidth-10)/2*(i%2);
        float Y = i/2*100+40;
        float W = (ScreenWidth-10)/2;
        float H = 90;
        
        ChoiceRoom *choiceRoom = [[ChoiceRoom alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        choiceRoom.layer.cornerRadius = 5;
        choiceRoom.clipsToBounds = YES;
        choiceRoom.backgroundColor = [UIColor grayColor];
        choiceRoom.tag = 100+i;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [choiceRoom addGestureRecognizer:tap];
        
        [self addSubview:choiceRoom];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceRoom.frame));
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    
    MTBaseScrollView *contentScrollView = self.superview;
    [contentScrollView.controller.navigationController pushViewController:themeListController animated:YES];
}
@end
