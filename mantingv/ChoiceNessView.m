//
//  ChoiceNessView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceNessView.h"
typedef void(^SeeMoreBlock)();
@interface ChoiceNessView ()
@property (nonatomic,copy) SeeMoreBlock seeMoreBlock;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIButton *seeMore;
@property (nonatomic,strong) NSMutableArray *contents;
@end
@implementation ChoiceNessView

#pragma mark - 创建以及配置视图对象
+ (instancetype)choiceNessViewWith:(NSString *)title point:(CGPoint)point{
    CGRect frame = CGRectMake(point.x, point.y, ScreenWidth, Screenheight);
    ChoiceNessView *choiceNessView = [[self alloc] initWithFrame:frame];
    
    choiceNessView.titleLabel.text = title;
    choiceNessView.titleLabel.sizeToFit;
    
    return choiceNessView;
}

- (id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIButton *seeMore = [UIButton buttonWithType:UIButtonTypeCustom];
        seeMore.frame = CGRectMake(ScreenWidth-100, 0, 100, 30);
        _seeMore = seeMore;
        [self addSubview:seeMore];
        [seeMore setTitle:@"查看更多" forState:UIControlStateNormal];
        [seeMore addTarget:self action:@selector(dealSeeMore) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


- (void)dealSeeMore{
    if (self.seeMoreBlock) {
        self.seeMoreBlock();
    }
}


- (void)setClickedAction:(void (^)())action{
    self.seeMoreBlock = action;
}


- (void)setValueWith:(id)data{
    //创建自定义视图
}
@end
