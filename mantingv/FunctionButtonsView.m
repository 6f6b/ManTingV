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
    FunctionButtonsView *functionButtonsView = [[FunctionButtonsView alloc] initWithFrame:CGRectMake(origin.x, origin.y, SCREEN_WIDTH, 100)];
    return functionButtonsView;
}

- (void)setImages:(NSArray *)images titles:(NSArray *)titles{
    [self setImages:images];
    [self setTitles:titles];
}

- (void)setImagesWithUrls:(NSArray *)images titles:(NSArray *)titles{
    [self setImagesWithUrls:images];
    [self setTitles:titles];
}


- (void)setImages:(NSArray *)images{
    
    for (int i=0; i<images.count; i++) {
        CGFloat X = SCREEN_WIDTH/images.count*i;
        CGFloat Y = 0;
        CGFloat W = SCREEN_WIDTH/images.count;
        CGFloat H = self.frame.size.height-20;
        
        UIView *buttonContentView = [[UIView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [self addSubview:buttonContentView];
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonContentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(buttonContentView).with.offset(10);
            make.bottom.equalTo(buttonContentView).with.offset(-10);
            make.left.equalTo(buttonContentView).with.offset(10);
            make.right.equalTo(buttonContentView).with.offset(-10);
            
        }];

    }
}

- (void)setImagesWithUrls:(NSArray *)images{
    for (int i=0; i<images.count; i++) {
        CGFloat X = SCREEN_WIDTH/images.count*i;
        CGFloat Y = 0;
        CGFloat W = SCREEN_WIDTH/images.count;
        CGFloat H = self.frame.size.height-20;
        
        UIView *buttonContentView = [[UIView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        [self addSubview:buttonContentView];
        
        UIButton *button = [[UIButton alloc] init];
        NSURL *url = [NSURL URLWithString:images[i]];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:data];
        [button setImage:image forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonContentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(buttonContentView).with.offset(10);
            make.bottom.equalTo(buttonContentView).with.offset(-10);
            make.left.equalTo(buttonContentView).with.offset(10);
            make.right.equalTo(buttonContentView).with.offset(-10);

        }];
    }
}

- (void)setTitles:(NSArray *)titles{
    for (int i=0; i<titles.count; i++) {
        CGFloat X = SCREEN_WIDTH/titles.count*i;
        CGFloat Y = self.frame.size.height-20;
        CGFloat W = SCREEN_WIDTH/titles.count;
        CGFloat H = 20;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(X,Y, W, H)];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.text = titles[i];
    }
}
- (void)dealButton:(UIButton *)button{
    [self.delegate clickedAtIndexOfButton:button.tag];
}
@end
