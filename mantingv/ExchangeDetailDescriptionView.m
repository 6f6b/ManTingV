//
//  ExchangeDetailDescriptionView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailDescriptionView.h"
#import "ExchangeDetailBaseView.h"
@interface ExchangeDetailDescriptionView ()
@property (nonatomic,weak) ExchangeDetailBaseView *exchangeDetailForAddressView;
@property (nonatomic,weak) ExchangeDetailBaseView *exchangeDetailForDeveloperView;
@property (nonatomic,weak) ExchangeDetailBaseView *exchangeDetailForBuildingPermitsView;
@property (nonatomic,weak) ExchangeDetailBaseView *exchangeDetailForOpeningTimeView;
@end

@implementation ExchangeDetailDescriptionView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.exchangeDetailForAddressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(@50);
    }];
    
    [self.exchangeDetailForDeveloperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.exchangeDetailForAddressView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.exchangeDetailForAddressView);
    }];
    
    [self.exchangeDetailForBuildingPermitsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.exchangeDetailForDeveloperView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.exchangeDetailForDeveloperView);
    }];
    
    [self.exchangeDetailForOpeningTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.exchangeDetailForBuildingPermitsView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.exchangeDetailForBuildingPermitsView);
    }];
}

- (ExchangeDetailBaseView *)exchangeDetailForAddressView{
    if (nil == _exchangeDetailForAddressView) {
        ExchangeDetailBaseView *exchangeDetailForAddressView = [[ExchangeDetailBaseView alloc] init];
        [self addSubview:exchangeDetailForAddressView];
        exchangeDetailForAddressView.leftLabel.text = @"地址";
        _exchangeDetailForAddressView = exchangeDetailForAddressView;
    }
    return _exchangeDetailForAddressView;
}

- (ExchangeDetailBaseView *)exchangeDetailForDeveloperView{
    if (nil == _exchangeDetailForDeveloperView) {
        ExchangeDetailBaseView *exchangeDetailForDeveloperView = [[ExchangeDetailBaseView alloc] init];
        [self addSubview:exchangeDetailForDeveloperView];
        exchangeDetailForDeveloperView.leftLabel.text = @"开发商";
        _exchangeDetailForDeveloperView = exchangeDetailForDeveloperView;
    }
    return _exchangeDetailForDeveloperView;
}

- (ExchangeDetailBaseView *)exchangeDetailForBuildingPermitsView{
    if (nil == _exchangeDetailForBuildingPermitsView) {
        ExchangeDetailBaseView *exchangeDetailForBuildingPermitsView = [[ExchangeDetailBaseView alloc] init];
        [self addSubview:exchangeDetailForBuildingPermitsView];
        exchangeDetailForBuildingPermitsView.leftLabel.text = @"楼盘许可证";
        _exchangeDetailForBuildingPermitsView = exchangeDetailForBuildingPermitsView;
    }
    return _exchangeDetailForBuildingPermitsView;
}

- (ExchangeDetailBaseView *)exchangeDetailForOpeningTimeView{
    if (nil == _exchangeDetailForOpeningTimeView) {
        ExchangeDetailBaseView *exchangeDetailForOpeningTimeView = [[ExchangeDetailBaseView alloc] init];
        [self addSubview:exchangeDetailForOpeningTimeView];
        exchangeDetailForOpeningTimeView.leftLabel.text = @"开盘时间";
        _exchangeDetailForOpeningTimeView = exchangeDetailForOpeningTimeView;
    }
    return _exchangeDetailForOpeningTimeView;
}

- (void)setValueWith:(id)data{
    self.exchangeDetailForAddressView.rightLabel.text = @"成都";
    self.exchangeDetailForDeveloperView.rightLabel.text = @"manting";
    self.exchangeDetailForBuildingPermitsView.rightLabel.text = @"110-";
    self.exchangeDetailForOpeningTimeView.rightLabel.text = @"2016";

//    CGRect frame = self.frame;
//    frame.size.height = CGRectGetMaxY(self.exchangeDetailForOpeningTimeView.frame);
//    self.frame = frame;
//    
//    NSLog(@">>>>>>>>>%@",NSStringFromCGRect(self.frame));
}
@end
