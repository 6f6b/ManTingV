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
    MTModel *model = [MTModel modelWithDictionary:data];
    NSArray *arr = model.data;
    for (int i=0; i<arr.count; i++) {
        float X = i%2*10+(SCREEN_WIDTH-10)/2*(i%2);
        float Y = i/2*160+40;
        float W = (SCREEN_WIDTH-10)/2;
        float H = 150;
        
        ChoiceRoom *choiceRoom = [[ChoiceRoom alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        choiceRoom.controller = self.controller;
        choiceRoom.layer.cornerRadius = 5;
        choiceRoom.clipsToBounds = YES;
        choiceRoom.backgroundColor = [UIColor whiteColor];
        choiceRoom.tag = 100+i;
        
        [self addSubview:choiceRoom];
        [choiceRoom setValueWith:arr[i]];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceRoom.frame));
        
    }
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = (UIScrollView *)self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
}

@end
