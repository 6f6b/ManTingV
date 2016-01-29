//
//  ExchangeView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/30.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeView.h"
#import "ExchangeDetailController.h"
#import "ExchangePoolDTOModel.h"
#import "HouseInfoDTOModel.h"
#import "ExchangeController.h"

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
        make.right.equalTo(self.roomNumber);
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
    ExchangeController *exchangeController = (ExchangeController *)self.controller;
    exchangeDetailController.myHouseGuid = exchangeController.myHouseGuid;
    ExchangePoolDTOModel *exchangePoolDTOModel = (ExchangePoolDTOModel *)self.model;
    exchangeDetailController.exchangePoolGuid = exchangePoolDTOModel.guid;
    [self.controller.navigationController pushViewController:exchangeDetailController animated:YES];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.clipsToBounds = YES;
        backImage.layer.cornerRadius = 3;
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}


- (UILabel *)roomNumberLabel{
    if (nil == _roomNumberLabel) {
        UILabel *roomNumberLabel = [[UILabel alloc] init];
        roomNumberLabel.font = [UIFont systemFontOfSize:15];
        roomNumberLabel.text = @"房号";
        roomNumberLabel.backgroundColor = [UIColor orangeColor];
        roomNumberLabel.textColor = [UIColor whiteColor];
        [self addSubview:roomNumberLabel];
        _roomNumberLabel = roomNumberLabel;
    }
    return _roomNumberLabel;
}

- (UILabel *)roomNumber{
    if (nil == _roomNumber) {
        UILabel *roomNumber = [[UILabel alloc] init];
        roomNumber.font = [UIFont systemFontOfSize:15];
        roomNumber.text = @"110";
        roomNumber.backgroundColor = [UIColor grayColor];
        roomNumber.textColor = [UIColor whiteColor];
        [self addSubview:roomNumber];
        _roomNumber = roomNumber;
    }
    return _roomNumber;
}

- (UILabel *)cycleLabel{
    if (nil == _cycleLabel) {
        UILabel *cycleLabel = [[UILabel alloc] init];
        cycleLabel.font = [UIFont systemFontOfSize:15];
        cycleLabel.text = @"【旺季周】";
        cycleLabel.textColor = [UIColor colorWithRed:11/255.0 green:198/255.0 blue:191/255.0 alpha:1.000];
        [self addSubview:cycleLabel];
        _cycleLabel = cycleLabel;
    }
    return _cycleLabel;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = @"老子山";
        titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.font = [UIFont systemFontOfSize:13];
        houseTypeLabel.text = @"房型：两房一厅";
        houseTypeLabel.textColor = [UIColor grayColor];
        houseTypeLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)exchangeNumberOfDaysLabel{
    if (nil == _exchangeNumberOfDaysLabel) {
        UILabel *exchangeNumberOfDaysLabel = [[UILabel alloc] init];
        exchangeNumberOfDaysLabel.font = [UIFont systemFontOfSize:13];
        exchangeNumberOfDaysLabel.text = @"交换天数：30";
        exchangeNumberOfDaysLabel.backgroundColor = [UIColor whiteColor];
        exchangeNumberOfDaysLabel.textColor = [UIColor grayColor];
        [self addSubview:exchangeNumberOfDaysLabel];
        _exchangeNumberOfDaysLabel = exchangeNumberOfDaysLabel;
    }
    return _exchangeNumberOfDaysLabel;
}

- (UILabel *)addressLabel{
    if (nil == _addressLabel) {
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.font = [UIFont systemFontOfSize:13];
        addressLabel.text = @"地址：成都市";
        addressLabel.backgroundColor = [UIColor whiteColor];
        addressLabel.textColor = [UIColor grayColor];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.text = @"￥100";
        priceLabel.backgroundColor = [UIColor whiteColor];
        priceLabel.textColor = [UIColor redColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{
    ExchangePoolDTOModel *exchangePoolDTOModel = [ExchangePoolDTOModel modelWithDictionary:data];
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:exchangePoolDTOModel.houseInfoDTO];
    self.model = exchangePoolDTOModel;
    
    [self.backImage lfSetImageWithURL:houseInfoDTOModel.imageGuids[0]];
    self.roomNumber.text = @"110";
    self.cycleLabel.text = [NSString stringWithFormat:@"【%@】",exchangePoolDTOModel.houseWeekName];
    self.titleLabel.text = houseInfoDTOModel.name;
    self.houseTypeLabel.text = [NSString stringWithFormat:@"房型：%@",houseInfoDTOModel.houseType];
    self.exchangeNumberOfDaysLabel.text = [NSString stringWithFormat:@"交换天数：%@",NULL];
    self.addressLabel.text = [NSString stringWithFormat:@"地址:%@%@",houseInfoDTOModel.province,houseInfoDTOModel.city];
    self.priceLabel.text = [NSString stringWithFormat:@"价格：%@￥",houseInfoDTOModel.price];
    //@property (nonatomic,weak) UIImageView *backImage;
    //@property (nonatomic,weak) UILabel *roomNumberLabel;
    //@property (nonatomic,weak) UILabel *roomNumber;
    //@property (nonatomic,weak) UILabel *cycleLabel;
    //@property (nonatomic,weak) UILabel *titleLabel;
    //@property (nonatomic,weak) UILabel *houseTypeLabel;
    //@property (nonatomic,weak) UILabel *exchangeNumberOfDaysLabel;
    //@property (nonatomic,weak) UILabel *addressLabel;
    //@property (nonatomic,weak) UILabel *priceLabel;
}

@end
