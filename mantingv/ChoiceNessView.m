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
@property (nonatomic,weak) UIButton *seeMore;
@property (nonatomic,strong) NSMutableArray *contents;
@property (nonatomic,weak) UILabel *titleLabel;

@end
@implementation ChoiceNessView

#pragma mark - 创建以及配置视图对象
+ (instancetype)choiceNessViewWithPoint:(CGPoint)point{
    CGRect frame = CGRectMake(point.x, point.y, SCREEN_WIDTH, SCREEN_HEIGHT);
    ChoiceNessView *choiceNessView = [[self alloc] initWithFrame:frame];
    
    return choiceNessView;
}

- (id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 20, 20)];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIButton *seeMore = [UIButton buttonWithType:UIButtonTypeCustom];
        seeMore.frame = CGRectMake(SCREEN_WIDTH-80, 5, 100, 30);
        _seeMore = seeMore;
        [self addSubview:seeMore];
        [seeMore setTitleColor:[UIColor colorWithRed:0.464 green:0.467 blue:0.461 alpha:1.000] forState:UIControlStateNormal];
        seeMore.titleLabel.font = [UIFont systemFontOfSize:13];
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

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
    self.titleLabel.sizeToFit;
}

- (void)setValueWith:(id)data{
    //创建自定义视图
}
@end
