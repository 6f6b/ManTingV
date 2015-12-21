//
//  ExchangeDetailPayMessageView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailPayMessageView.h"

@interface ExchangeDetailPayMessageView ()

@end
@implementation ExchangeDetailPayMessageView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
//    
//    [self.payMessageMarkView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superView);
//        make.left.equalTo(superView);
//        make.right.equalTo(superView);
//        
//        make.height.equalTo(@50);
//    }];
//    
//    [self.separationOfPowersView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.payMessageMarkView.mas_bottom);
//        make.left.equalTo(superView);
//        make.right.equalTo(superView);
//        
//        make.height.equalTo(@50);
//    }];
//    
//    [self.propertyManagementFeeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.separationOfPowersView.mas_bottom);
//        make.left.equalTo(superView);
//        make.right.equalTo(superView);
//        
//        make.height.equalTo(@50);
//    }];
    
    [self.shouldPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberOfShouldPayLabel.mas_left);
        
        make.top.equalTo(self.propertyManagementFeeView.mas_bottom);
    }];
    
    [self.numberOfShouldPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.right.equalTo(superView).with.offset(-10);
        
        make.top.equalTo(self.propertyManagementFeeView.mas_bottom);
    }];
}

- (ExchangeDetailBaseView *)payMessageMarkView{
    if (nil == _payMessageMarkView) {
        ExchangeDetailBaseView *payMessageMarkView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        payMessageMarkView.leftLabel.text = @"支付信息";
        payMessageMarkView.rightLabel.text = @"";
        payMessageMarkView.backgroundColor = [UIColor grayColor];
        [self addSubview:payMessageMarkView];
        _payMessageMarkView = payMessageMarkView;
    }
    return _payMessageMarkView;
}


- (ExchangeDetailBaseView *)separationOfPowersView{
    if (nil == _separationOfPowersView) {
        ExchangeDetailBaseView *separationOfPowersView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.payMessageMarkView.frame), ScreenWidth, 50)];
        separationOfPowersView.leftLabel.text = @"分权周价";
        separationOfPowersView.backgroundColor = [UIColor whiteColor];
        [self addSubview:separationOfPowersView];
        _separationOfPowersView = separationOfPowersView;
    }
    return _separationOfPowersView;
}

- (ExchangeDetailBaseView *)propertyManagementFeeView{
    if (nil == _propertyManagementFeeView) {
        ExchangeDetailBaseView *propertyManagementFeeView = [[ExchangeDetailBaseView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.separationOfPowersView.frame), ScreenWidth, 50)];
        propertyManagementFeeView.leftLabel.text = @"物业管理费";
        propertyManagementFeeView.backgroundColor = [UIColor whiteColor];
        [self addSubview:propertyManagementFeeView];
        _propertyManagementFeeView = propertyManagementFeeView;
    }
    return _propertyManagementFeeView;
}

- (UILabel *)shouldPayLabel{
    if (nil == _shouldPayLabel) {
        UILabel *shouldPayLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-100, CGRectGetMaxY(self.propertyManagementFeeView.frame), 40, 23)];
        shouldPayLabel.text = @"应付金额：";
        [self addSubview:shouldPayLabel];
        _shouldPayLabel = shouldPayLabel;
    }
    return _shouldPayLabel;
}

- (UILabel *)numberOfShouldPayLabel{
    if (nil == _numberOfShouldPayLabel) {
        UILabel *numberOfShouldPayLabel = [[UILabel alloc] init];
        numberOfShouldPayLabel.text = @"0.0";
        [self addSubview:numberOfShouldPayLabel];
        _numberOfShouldPayLabel = numberOfShouldPayLabel;
    }
    return _numberOfShouldPayLabel;
}

- (void)setValueWith:(id)data{
    self.separationOfPowersView.rightLabel.text = @"500";
    self.propertyManagementFeeView.rightLabel.text = @"500";
    NSLog(@",,,,,,,%@",NSStringFromCGRect(self.shouldPayLabel.frame));
//    CGRect frame = self.frame;
//    frame.size.height = CGRectGetMaxY(self.numberOfShouldPayLabel.frame);
//    self.frame = frame;
}
@end
