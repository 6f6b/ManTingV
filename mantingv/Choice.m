//
//  Choice.m
//  mantingv
//
//  Created by LiuFeng on 15/12/9.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "Choice.h"
#import "ChoiceRoom.h"
#import "ChoiceTheme.h"

@interface Choice ()
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UIButton *seeMore;
@property (nonatomic,strong) NSMutableArray *contents;
@end
@implementation Choice
- (id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIButton *seeMore = [UIButton buttonWithType:UIButtonTypeCustom];
        seeMore.frame = CGRectMake(ScreenWidth-100, 0, 100, 30);
        NSLog(@"%@",NSStringFromCGRect(frame));
        _seeMore = seeMore;
        [self addSubview:seeMore];
        [seeMore setTitle:@"查看更多" forState:UIControlStateNormal];
        [seeMore addTarget:self action:@selector(dealSeeMore) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


//“查看更多”按钮点击事件
- (void)dealSeeMore{
    NSLog(@"查看更多");
}

- (void)setValueWith:(NSInteger)type model:(MTModel *)model{
    if (type) {
        self.titleLabel.text = @"精选主题";
        for(int i=0;i<5;i++){
            ChoiceTheme *choiceTheme = [[ChoiceTheme alloc] init];
            choiceTheme.backgroundColor = [UIColor brownColor];
            choiceTheme.layer.cornerRadius = 5;
            choiceTheme.clipsToBounds = YES;
            choiceTheme.tag = 100+i;
            
            //添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTapChoiceTheme:)];
            [choiceTheme addGestureRecognizer:tap];
            
            float X = 0;
            float Y = 30+155*i;
            float W = ScreenWidth;
            float H = 150;
            choiceTheme.frame = CGRectMake(X, Y, W, H);
            [self addSubview:choiceTheme];
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceTheme.frame));
        }
    }
    else{
        self.titleLabel.text = @"精选房间";
        for (int i=0; i<10; i++) {
            float X = i%2*10+(ScreenWidth-10)/2*(i%2);
            float Y = i/2*100;
            float W = (ScreenWidth-10)/2;
            float H = 90;
            
            ChoiceRoom *choiceRoom = [[ChoiceRoom alloc] initWithFrame:CGRectMake(X, Y, W, H)];
            choiceRoom.layer.cornerRadius = 5;
            choiceRoom.clipsToBounds = YES;
            choiceRoom.backgroundColor = [UIColor grayColor];
            choiceRoom.tag = 100+i;
            
            //添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTapChoiceRoom:)];
            [choiceRoom addGestureRecognizer:tap];
            
            [self addSubview:choiceRoom];
            //choiceRoom.frame = CGRectMake(X, Y, W, H);
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(choiceRoom.frame));
        }
    }
    self.titleLabel.sizeToFit;
    
    //获取到父视图指针，在数据加载完成之后重新调整父视图的Contentsize
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
    
    
}

//“精选主题”添加手势点击事件
- (void)dealTapChoiceTheme:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    NSLog(@"%@-->%lu",self.titleLabel.text,view.tag);
}

//“精选房间”添加手势点击事件
- (void)dealTapChoiceRoom:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    NSLog(@"%@-->%lu",self.titleLabel.text,view.tag);
}
@end
