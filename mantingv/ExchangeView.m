//
//  ExchangeView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/30.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeView.h"
#import "ExchangeDetailController.h"

@interface ExchangeView ()
//@property (nonatomic,weak) UIImageView *backImage;
//@property (nonatomic,weak) UILabel *roomNumberLabel;
//@property (nonatomic,weak) UILabel *roomNumber;
//@property (nonatomic,weak) UILabel *cycleLabel;
//@property (nonatomic,weak) UILabel *titleLabel;
//@property (nonatomic,weak) UILabel *houseTypeLabel;
//@property (nonatomic,weak) UILabel *exchangeNumberOfDaysLabel;
//@property (nonatomic,weak) UILabel *addressLabel;
//@property (nonatomic,weak) UILabel *priceLabel;
@end
@implementation ExchangeView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //背景图
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
        
        make.bottom.equalTo(superView).with.offset(-10);
        make.width.equalTo(@100);
    }];
    
    //房间号标签
    [self.roomNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
    }];
    
    //房间号
    [self.roomNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(self.roomNumberLabel.mas_bottom);
    }];
    
    //周期
    [self.cycleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(superView).with.offset(10);
    }];
    
    //主题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(self.cycleLabel.mas_right).with.offset(10);
    }];
    
    //房型
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    
    //交换天数
    [self.exchangeNumberOfDaysLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.houseTypeLabel.mas_right).with.offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    
    //地址
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.exchangeNumberOfDaysLabel.mas_bottom);
    }];
    
    //价格
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
        make.top.equalTo(self.addressLabel.mas_bottom);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (void)dealTap{
    ExchangeDetailController *exchangeDetailController = [[ExchangeDetailController alloc] init];
    [self.controller.navigationController pushViewController:exchangeDetailController animated:YES];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.backgroundColor = [UIColor orangeColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}


- (UILabel *)roomNumberLabel{
    if (nil == _roomNumberLabel) {
        UILabel *roomNumberLabel = [[UILabel alloc] init];
        roomNumberLabel.text = @"房号";
        roomNumberLabel.backgroundColor = [UIColor redColor];
        [self addSubview:roomNumberLabel];
        _roomNumberLabel = roomNumberLabel;
    }
    return _roomNumberLabel;
}

- (UILabel *)roomNumber{
    if (nil == _roomNumber) {
        UILabel *roomNumber = [[UILabel alloc] init];
        roomNumber.text = @"110";
        roomNumber.backgroundColor = [UIColor grayColor];
        [self addSubview:roomNumber];
        _roomNumber = roomNumber;
    }
    return _roomNumber;
}

- (UILabel *)cycleLabel{
    if (nil == _cycleLabel) {
        UILabel *cycleLabel = [[UILabel alloc] init];
        cycleLabel.text = @"【旺季周】";
        cycleLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:cycleLabel];
        _cycleLabel = cycleLabel;
    }
    return _cycleLabel;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"老子山";
        titleLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.text = @"房型：两房一厅";
        houseTypeLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)exchangeNumberOfDaysLabel{
    if (nil == _exchangeNumberOfDaysLabel) {
        UILabel *exchangeNumberOfDaysLabel = [[UILabel alloc] init];
        exchangeNumberOfDaysLabel.text = @"交换天数：30";
        exchangeNumberOfDaysLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:exchangeNumberOfDaysLabel];
        _exchangeNumberOfDaysLabel = exchangeNumberOfDaysLabel;
    }
    return _exchangeNumberOfDaysLabel;
}

- (UILabel *)addressLabel{
    if (nil == _addressLabel) {
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.text = @"地址：成都市";
        addressLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.text = @"￥100";
        priceLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{

}

@end
