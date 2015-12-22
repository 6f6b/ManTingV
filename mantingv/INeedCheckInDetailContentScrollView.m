//
//  INeedCheckInDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedCheckInDetailContentScrollView.h"
#import "CheckInDetailTopContentView.h"
#import "CheckInDetailMessageContainView.h"
#import "CheckInDetailTimeView.h"

@interface INeedCheckInDetailContentScrollView ()
@property (nonatomic,weak) CheckInDetailTopContentView *checkInDetailTopContentView;
@property (nonatomic,weak) CheckInDetailMessageContainView *checkInDetailMessageContainView;
@property (nonatomic,weak) CheckInDetailTimeView *checkInDetailTimeView;
@property (nonatomic,weak) UIButton *payButton;
@end

@implementation INeedCheckInDetailContentScrollView

- (CheckInDetailTopContentView *)checkInDetailTopContentView{
    if (nil == _checkInDetailTopContentView) {
        CheckInDetailTopContentView *checkInDetailTopContentView =
        [CheckInDetailTopContentView checkInDetailTopContentView];
        [self addSubview:checkInDetailTopContentView];
        _checkInDetailTopContentView = checkInDetailTopContentView;
    }
    return _checkInDetailTopContentView;
}

- (CheckInDetailMessageContainView *)checkInDetailMessageContainView{
    if (nil == _checkInDetailMessageContainView) {
        CheckInDetailMessageContainView *checkInDetailMessageContainView =
        [[CheckInDetailMessageContainView alloc] init];
        checkInDetailMessageContainView.backgroundColor = [UIColor orangeColor];
        CGRect frame = CGRectMake(0, CGRectGetMaxY(self.checkInDetailTimeView.frame)+10, ScreenWidth, 180);
        checkInDetailMessageContainView.frame = frame;
        [self addSubview:checkInDetailMessageContainView];
        _checkInDetailMessageContainView = checkInDetailMessageContainView;
    }
    return _checkInDetailMessageContainView;
}

- (CheckInDetailTimeView *)checkInDetailTimeView{
    if (nil == _checkInDetailTimeView) {
        CheckInDetailTimeView *checkInDetailTimeView = [[CheckInDetailTimeView alloc] init];
        checkInDetailTimeView.frame = CGRectMake(0, CGRectGetMaxY(self.checkInDetailTopContentView.frame)+10, ScreenWidth, 50);
        checkInDetailTimeView.backgroundColor = [UIColor greenColor];
        [self addSubview:checkInDetailTimeView];
        _checkInDetailTimeView = checkInDetailTimeView;
    }
    return _checkInDetailTimeView;
}

- (UIButton *)payButton{
    if (nil == _payButton) {
        UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [payButton addTarget:self action:@selector(dealPay) forControlEvents:UIControlEventTouchUpInside];
        payButton.backgroundColor = [UIColor orangeColor];
        [payButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [self addSubview:payButton];
        _payButton = payButton;
    }
    return _payButton;
}

- (void)setValueWith:(id)data{
    
    [self.checkInDetailTopContentView setValueWith:nil];
    
    [self.checkInDetailTimeView setValueWith:nil];
    
    [self.checkInDetailMessageContainView setValueWith:nil];
    
    self.payButton.frame = CGRectMake(10, CGRectGetMaxY(self.checkInDetailMessageContainView.frame)+20, ScreenWidth-20, 50);
    
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.payButton.frame)+20);
}

- (void)dealPay{
    NSLog(@"立即支付");
}
@end
