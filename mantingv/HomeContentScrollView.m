//
//  HomeContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeContentScrollView.h"

#import "ThemeScrollView.h"
#import "ProductController.h"
#import "CheckInController.h"
#import "RightsListController.h"
#import "ChoiceNessRoom.h"
#import "ShortRentController.h"
#import "ThemeContentView.h"
@interface HomeContentScrollView ()
@property (nonatomic,weak) ThemeScrollView *themeScrollView;
@property (nonatomic,weak) ThemeContentView *themeContentView;
@property (nonatomic,weak) UIImageView *what;
@end

@implementation HomeContentScrollView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.fourButtons = [[NSMutableArray alloc] init];
        
        //滚动广告视图
        
        //四个按钮
        [self setButtons];
        
        //默认两个主题
        UIButton *button = self.fourButtons[0];
        self.themeContentView.frame = CGRectMake(0, CGRectGetMaxY(button.frame), ScreenWidth, 100);
        [self.themeContentView setValueWith:nil];
        
        //不知道什么鬼
        self.what.frame = CGRectMake(0, CGRectGetMaxY(self.themeContentView.frame), frame.size.width, 200);
        
        //精选主题
        [self.choiceNessTheme setValueWith:nil];
        
        //精选房间
        [self.choiceNessRoom setValueWith:nil];
    }
    return self;
}

#pragma mark - 滚动广告视图
- (LFLoopScrollView *)adScrollView{
    if (nil == _adScrollView) {
        LFLoopScrollView *adScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        adScrollView.autoScroll = YES;
        adScrollView.backgroundColor = [UIColor greenColor];
        _adScrollView = adScrollView;
        NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
        [_adScrollView setImageWithUrlS:urls];
        [self addSubview:_adScrollView];
    }
    return _adScrollView;
}

#pragma  mark - 买房、入住、交换、转让按钮
- (void)setButtons{
    NSArray *titles = @[@"我要买房",@"我要入住",@"我要交换",@"我要转让"];
    //NSArray *images = @[];
    for (int i=0; i<4; i++) {
        float btnX = i*ScreenWidth/4;
        float btnY = CGRectGetMaxY(self.adScrollView.frame);
        float btnW = ScreenWidth/4;
        float btnH = 50;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [button setBackgroundImage:[UIImage imageNamed:@"RSS_button_48px_1104904_easyicon.net"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(10, 20, -20, -10)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(20, 0, -20, 0)];
        
        //button.
        button.tag = 100+i;
        [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.fourButtons addObject:button];
        [self addSubview:button];
    }
}

- (void)setButtonWithImage:(UIImage *)image frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dealButton:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)dealButton:(UIButton *)button{
    NSLog(@"%lu",button.tag);
    if (100 == button.tag) {
        ProductController *pc = [[ProductController alloc] init];
        [self.controller.navigationController pushViewController:pc animated:YES];
    }
    else if(101 == button.tag){
        CheckInController *checkIn = [[CheckInController alloc] init];
        [self.controller.navigationController pushViewController:checkIn animated:YES];
    }
    else{
        RightsListController *rightsVC = [[RightsListController alloc] init];
        [self.controller.navigationController pushViewController:rightsVC animated:YES];
    }
    
}

#pragma mark - 默认的两个主题
- (ThemeScrollView *)themeScrollView{
    if (nil == _themeScrollView) {
        ThemeScrollView *themeScrollView = [[ThemeScrollView alloc] init];
        [self addSubview:themeScrollView];
        themeScrollView.backgroundColor = [UIColor blueColor];
        _themeScrollView = themeScrollView;
    }
    return _themeScrollView;
}


- (ThemeContentView *)themeContentView{
    if (nil == _themeContentView) {
        ThemeContentView *themeContentView = [[ThemeContentView alloc] init];
        [self addSubview:themeContentView];
        themeContentView.backgroundColor = [UIColor blueColor];
        _themeContentView = themeContentView;
    }
    return _themeContentView;
}
#pragma mark - 不知道什么鬼
- (UIImageView *)what{
    if (nil == _what) {
        UIImageView *what = [[UIImageView alloc] init];
        what.backgroundColor = [UIColor redColor];
        [self addSubview:what];
        _what = what;
    }
    return _what;
}

#pragma mark - 精选主题
- (ChoiceNessTheme *)choiceNessTheme{
    if (nil == _choiceNessTheme) {
        ChoiceNessTheme *choiceNessTheme = [ChoiceNessTheme choiceNessViewWith:@"精选主题" point:CGPointMake(0,CGRectGetMaxY(self.what.frame))];
        choiceNessTheme.backgroundColor = [UIColor greenColor];
        [choiceNessTheme setClickedAction:^{
            ProductController *productController = [[ProductController alloc] init];
            [self.controller.navigationController pushViewController:productController animated:YES];
        }];
        [self addSubview:choiceNessTheme];
        _choiceNessTheme = choiceNessTheme;
    }
    return _choiceNessTheme;
}


#pragma mark - 精选房间
- (ChoiceNessRoom *)choiceNessRoom{
    if (nil == _choiceNessRoom) {
        ChoiceNessRoom *choiceNessRoom = [ChoiceNessRoom choiceNessViewWith:@"精选房间" point:CGPointMake(0, CGRectGetMaxY(self.choiceNessTheme.frame))];
        [choiceNessRoom setClickedAction:^{
            ShortRentController *shortController = [[ShortRentController alloc] init];
            [self.controller.navigationController pushViewController:shortController animated:YES];
        }];
        choiceNessRoom.backgroundColor = [UIColor greenColor];
        [self addSubview:choiceNessRoom];
        _choiceNessRoom = choiceNessRoom;
    }
    return _choiceNessRoom;
}


@end
