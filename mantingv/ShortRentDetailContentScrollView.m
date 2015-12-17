//
//  ShortRentDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentDetailContentScrollView.h"
#import "CheckInAndCheckOutView.h"
#import "ShortRentPriceView.h"
#import "RelatedProductsView.h"

@interface ShortRentDetailContentScrollView ()
@property (nonatomic,weak) LFLoopScrollView *shortRentDetailAdScrollView;
@property (nonatomic,weak) CheckInAndCheckOutView *checkInAndCheckOutView;
@property (nonatomic,weak) ShortRentPriceView *shortRentPriceView;
@property (nonatomic,weak) UILabel *relatedProductsLabel;
@property (nonatomic,weak) RelatedProductsView *relatedProductsView;
@end
@implementation ShortRentDetailContentScrollView

- (LFLoopScrollView *)shortRentDetailAdScrollView{
    if (nil == _shortRentDetailAdScrollView) {
        LFLoopScrollView *shortRentDetailAdScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
        shortRentDetailAdScrollView.autoScroll = YES;
        shortRentDetailAdScrollView.backgroundColor = [UIColor greenColor];
        _shortRentDetailAdScrollView = shortRentDetailAdScrollView;
        [self addSubview:shortRentDetailAdScrollView];
    }
    return _shortRentDetailAdScrollView;
}

- (CheckInAndCheckOutView *)checkInAndCheckOutView{
    if (nil == _checkInAndCheckOutView) {
        CheckInAndCheckOutView *checkInAndCheckOutView = [[CheckInAndCheckOutView alloc] init];
        checkInAndCheckOutView.backgroundColor = [UIColor yellowColor];
        [self addSubview:checkInAndCheckOutView];
        _checkInAndCheckOutView = checkInAndCheckOutView;
    }
    return _checkInAndCheckOutView;
}

- (ShortRentPriceView *)shortRentPriceView{
    if (nil == _shortRentPriceView) {
        ShortRentPriceView *shortRentPriceView = [[ShortRentPriceView alloc] init];
        shortRentPriceView.backgroundColor = [UIColor purpleColor];
        [self addSubview:shortRentPriceView];
        _shortRentPriceView = shortRentPriceView;
    }
    return _shortRentPriceView;
}

- (UILabel *)relatedProductsLabel{
    if (nil == _relatedProductsLabel) {
        UILabel *relatedProductsLabel = [[UILabel alloc] init];
        relatedProductsLabel.text = @"相关产品";
        relatedProductsLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:relatedProductsLabel];
        _relatedProductsLabel = relatedProductsLabel;
    }
    return _relatedProductsLabel;
}

- (RelatedProductsView *)relatedProductsView{
    if (nil == _relatedProductsView) {
        RelatedProductsView *relatedProductsView = [[RelatedProductsView alloc] init];
        relatedProductsView.backgroundColor = [UIColor purpleColor];
        [self addSubview:relatedProductsView];
        _relatedProductsView = relatedProductsView;
    }
    return _relatedProductsView;
}

- (void)setValueWith:(id)data{
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.shortRentDetailAdScrollView setImageWithUrlS:urls];
    
    self.checkInAndCheckOutView.frame = CGRectMake(0, CGRectGetMaxY(self.shortRentDetailAdScrollView.frame), ScreenWidth, 100);
    [self.checkInAndCheckOutView setValueWith:nil];
    
    
    self.shortRentPriceView.frame = CGRectMake(0, CGRectGetMaxY(self.checkInAndCheckOutView.frame)+20, ScreenWidth, 100);
    [self.shortRentPriceView setValueWith:nil];
    
    self.relatedProductsLabel.frame = CGRectMake(0, CGRectGetMaxY(self.shortRentPriceView.frame), ScreenWidth, 40);
    
    self.relatedProductsView.frame = CGRectMake(0, CGRectGetMaxY(self.relatedProductsLabel.frame), ScreenWidth, 0);
    [self.relatedProductsView setValueWith:nil];
    
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.relatedProductsView.frame));
}

@end
