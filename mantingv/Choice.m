//
//  Choice.m
//  mantingv
//
//  Created by LiuFeng on 15/12/9.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "Choice.h"
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



- (void)dealSeeMore{
    NSLog(@"查看更多");
}

- (void)setValueWith:(NSInteger)type model:(MTModel *)model{
    if (type) {
        self.titleLabel.text = @"精选主题";
        for(int i=0;i<5;i++){
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor brownColor];
            imageView.layer.cornerRadius = 5;
            imageView.clipsToBounds = YES;
            float X = 0;
            float Y = 30+155*i;
            float W = ScreenWidth;
            float H = 150;
            imageView.frame = CGRectMake(X, Y, W, H);
            [self addSubview:imageView];
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(imageView.frame));
        }
    }
    else{
        self.titleLabel.text = @"精选房间";
        for (int i=0; i<10; i++) {
            UIView *view = [[UIView alloc] init];
            view.layer.cornerRadius = 5;
            view.clipsToBounds = YES;
            float X = i%2*10+(ScreenWidth-10)/2*(i%2);
            float Y = i/2*100;
            float W = (ScreenWidth-10)/2;
            float H = 90;
            
            view.backgroundColor = [UIColor orangeColor];
            [self addSubview:view];
            view.frame = CGRectMake(X, Y, W, H);
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CGRectGetMaxY(view.frame));
        }
    }
    self.titleLabel.sizeToFit;
    UIScrollView *contentScrollView = self.superview;
    contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
    
    
}
@end
