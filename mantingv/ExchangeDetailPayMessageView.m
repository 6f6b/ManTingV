//
//  ExchangeDetailPayMessageView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeDetailPayMessageView.h"
#import "HouseInfoDTOModel.h"

@interface ExchangeDetailPayMessageView ()

@end
@implementation ExchangeDetailPayMessageView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.payMessageMarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(@50);
    }];
    
    [self.separationOfPowersView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payMessageMarkView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.payMessageMarkView);
    }];
    
    [self.propertyManagementFeeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separationOfPowersView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(self.separationOfPowersView);
    }];
    
    
    [self.shouldPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.propertyManagementFeeView.mas_bottom);
        
        make.right.equalTo(self.numberOfShouldPayLabel.mas_left);
        
        make.bottom.equalTo(superView);
    }];
    
    [self.numberOfShouldPayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.propertyManagementFeeView.mas_bottom);
        make.right.equalTo(superView).with.offset(-10);
        make.bottom.equalTo(superView);
    }];
    
//    [self.managementFeeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.forReceiveMessage.mas_bottom);
//        
//        make.right.equalTo(self.managementFee.mas_left);
//        
//        make.bottom.equalTo(superView);
//    }];
//    
//    [self.managementFee mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.forReceiveMessage.mas_bottom);
//        make.right.equalTo(superView).with.offset(-10);
//        make.bottom.equalTo(superView);
//    }];
}

- (ExchangeDetailBaseView *)payMessageMarkView{
    if (nil == _payMessageMarkView) {
        ExchangeDetailBaseView *payMessageMarkView = [[ExchangeDetailBaseView alloc] init];
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
        ExchangeDetailBaseView *separationOfPowersView = [[ExchangeDetailBaseView alloc] init];
        separationOfPowersView.leftLabel.text = @"分权周价";
        separationOfPowersView.backgroundColor = [UIColor whiteColor];
        [self addSubview:separationOfPowersView];
        _separationOfPowersView = separationOfPowersView;
    }
    return _separationOfPowersView;
}

- (ExchangeDetailBaseView *)propertyManagementFeeView{
    if (nil == _propertyManagementFeeView) {
        ExchangeDetailBaseView *propertyManagementFeeView = [[ExchangeDetailBaseView alloc] init];
        propertyManagementFeeView.leftLabel.text = @"物业管理费";
        propertyManagementFeeView.backgroundColor = [UIColor whiteColor];
        [self addSubview:propertyManagementFeeView];
        _propertyManagementFeeView = propertyManagementFeeView;
    }
    return _propertyManagementFeeView;
}

- (UILabel *)shouldPayLabel{
    if (nil == _shouldPayLabel) {
        UILabel *shouldPayLabel = [[UILabel alloc] init];
        shouldPayLabel.text = @"应付金额：";
        shouldPayLabel.backgroundColor = [UIColor greenColor];
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
    HouseInfoDTOModel *houseInfoDTOModel = data;
    self.separationOfPowersView.rightLabel.text = houseInfoDTOModel.price;
    self.propertyManagementFeeView.rightLabel.text = houseInfoDTOModel.price;
    self.numberOfShouldPayLabel.text = houseInfoDTOModel.price;
}
@end
