//
//  ExchangeDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailContentScrollView.h"
#import "ExchangeDetailDescriptionView.h"
#import "ExchangeDetailPayMessageView.h"
#import "ExchangeDetailBaseView.h"
#import "CommitSuccessController.h"

@interface ExchangeDetailContentScrollView ()
@property (nonatomic,weak) LFLoopScrollView *pictureScrollView;
@property (nonatomic,weak) ExchangeDetailBaseView *titleView;
@property (nonatomic,weak) ExchangeDetailDescriptionView *exchangeDetailDescriptionView;
@property (nonatomic,weak) ExchangeDetailPayMessageView *exchangeDetailPayMessageView;
@property (nonatomic,weak) UIButton *commitButton;
@end
@implementation ExchangeDetailContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.pictureScrollView.frame = CGRectMake(0, 0, ScreenWidth, 150);
    
    self.titleView.frame = CGRectMake(0, CGRectGetMaxY(self.pictureScrollView.frame), ScreenWidth, 80);
    
    self.exchangeDetailDescriptionView.frame = CGRectMake(0, CGRectGetMaxY(self.titleView.frame)+10, ScreenWidth, 200);
    
    self.exchangeDetailPayMessageView.frame = CGRectMake(0, CGRectGetMaxY(self.exchangeDetailDescriptionView.frame), ScreenWidth, 200);
    
    UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    commitButton.backgroundColor = [UIColor orangeColor];
    [commitButton setTitle:@"提交信息" forState:UIControlStateNormal];
    [commitButton addTarget:self action:@selector(dealBtn) forControlEvents:UIControlEventTouchUpInside];
    commitButton.frame = CGRectMake(10, CGRectGetMaxY(self.exchangeDetailPayMessageView.frame)+10, ScreenWidth-20, 50);
    [self addSubview:commitButton];
    _commitButton = commitButton;
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.commitButton.frame));
}

- (LFLoopScrollView *)pictureScrollView{
    if (nil == _pictureScrollView) {
        LFLoopScrollView *pictureScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        pictureScrollView.autoScroll = YES;
        pictureScrollView.backgroundColor = [UIColor greenColor];
        _pictureScrollView = pictureScrollView;
        
        [self addSubview:pictureScrollView];
    }
    return _pictureScrollView;
}

- (ExchangeDetailBaseView *)titleView{
    if (nil == _titleView) {
        ExchangeDetailBaseView *titleView = [[ExchangeDetailBaseView alloc] init];
        titleView.backgroundColor = [UIColor greenColor];
        _titleView = titleView;
        
        [self addSubview:titleView];
    }
    return _titleView;
}


- (ExchangeDetailDescriptionView *)exchangeDetailDescriptionView{
    if (nil == _exchangeDetailDescriptionView) {
        ExchangeDetailDescriptionView *exchangeDetailDescriptionView = [[ExchangeDetailDescriptionView alloc] init];
        exchangeDetailDescriptionView.backgroundColor = [UIColor redColor];
        _exchangeDetailDescriptionView = exchangeDetailDescriptionView;
        
        [self addSubview:exchangeDetailDescriptionView];
    }
    return _exchangeDetailDescriptionView;
}

- (ExchangeDetailPayMessageView *)exchangeDetailPayMessageView{
    if (nil == _exchangeDetailPayMessageView) {
        ExchangeDetailPayMessageView *exchangeDetailPayMessageView = [[ExchangeDetailPayMessageView alloc] init];
        exchangeDetailPayMessageView.backgroundColor = [UIColor redColor];
        _exchangeDetailPayMessageView = exchangeDetailPayMessageView;
        
        [self addSubview:exchangeDetailPayMessageView];
    }
    return _exchangeDetailPayMessageView;
}


- (void)setValueWith:(id)data{
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.pictureScrollView setImageWithUrlS:urls];
    
    [self.exchangeDetailDescriptionView setValueWith:nil];
    [self.exchangeDetailPayMessageView setValueWith:nil];
}

- (void)dealBtn{
    CommitSuccessController *commitSuccessController = [[CommitSuccessController alloc] init];
    [self.controller.navigationController pushViewController:commitSuccessController animated:YES];
}
@end
