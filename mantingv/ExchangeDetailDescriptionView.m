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

- (ExchangeDetailBaseView *)exchangeDetailForAddressView{
    if (nil == _exchangeDetailForAddressView) {
        ExchangeDetailBaseView *exchangeDetailForAddressView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        [self addSubview:exchangeDetailForAddressView];
        exchangeDetailForAddressView.leftLabel.text = @"地址";
        _exchangeDetailForAddressView = exchangeDetailForAddressView;
    }
    return _exchangeDetailForAddressView;
}

- (ExchangeDetailBaseView *)exchangeDetailForDeveloperView{
    if (nil == _exchangeDetailForDeveloperView) {
        ExchangeDetailBaseView *exchangeDetailForDeveloperView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.exchangeDetailForAddressView.frame), ScreenWidth, 50)];
        [self addSubview:exchangeDetailForDeveloperView];
        exchangeDetailForDeveloperView.leftLabel.text = @"开发商";
        _exchangeDetailForDeveloperView = exchangeDetailForDeveloperView;
    }
    return _exchangeDetailForDeveloperView;
}

- (ExchangeDetailBaseView *)exchangeDetailForBuildingPermitsView{
    if (nil == _exchangeDetailForBuildingPermitsView) {
        ExchangeDetailBaseView *exchangeDetailForBuildingPermitsView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.exchangeDetailForDeveloperView.frame), ScreenWidth, 50)];
        [self addSubview:exchangeDetailForBuildingPermitsView];
        exchangeDetailForBuildingPermitsView.leftLabel.text = @"楼盘许可证";
        _exchangeDetailForBuildingPermitsView = exchangeDetailForBuildingPermitsView;
    }
    return _exchangeDetailForBuildingPermitsView;
}

- (ExchangeDetailBaseView *)exchangeDetailForOpeningTimeView{
    if (nil == _exchangeDetailForOpeningTimeView) {
        ExchangeDetailBaseView *exchangeDetailForOpeningTimeView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.exchangeDetailForBuildingPermitsView.frame), ScreenWidth, 50)];
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

    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.exchangeDetailForOpeningTimeView.frame);
    self.frame = frame;
    
    NSLog(@">>>>>>>>>%@",NSStringFromCGRect(self.frame));
}
@end
