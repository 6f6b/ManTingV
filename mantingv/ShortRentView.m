//
//  ShortRentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentView.h"
#import "ShortRentViewModel.h"
#import "ShortRentDetailController.h"

@interface ShortRentView ()
@property (weak, nonatomic) UILabel *numOfRoomLabel;
@property (weak, nonatomic) UILabel *numOfRoom;
@property (weak, nonatomic) UIImageView *backImage;

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *houseTypeLabel;
@property (weak, nonatomic) UILabel *weeklyLabel;
@property (weak, nonatomic) UILabel *addressLabel;
@property (weak, nonatomic) UILabel *priceLabel;
@end
@implementation ShortRentView
/**
 *  设置约束加点击手势
 *
 *  @param newSuperview
 */
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //背景图
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(superView).with.offset(10);
        make.bottom.equalTo(superView).with.offset(-10);
        make.width.equalTo(self.backImage.mas_height);
    }];
    
    //房间号标签
    [self.numOfRoomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(superView).with.offset(10);
    }];
    
    //房间号
    [self.numOfRoom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView).with.offset(10);
        make.top.equalTo(self.numOfRoomLabel.mas_bottom);
    }];
    
    //title
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
    
    //房型
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
    
    //周次
    [self.weeklyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.houseTypeLabel);
        make.left.equalTo(self.houseTypeLabel.mas_right).with.offset(5);
    }];
    
    //地址
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.houseTypeLabel.mas_bottom);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
    
    //价格
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel.mas_bottom);
        make.left.equalTo(self.backImage.mas_right).with.offset(10);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (void)dealTap{
    ShortRentDetailController *shortRentDetailController = [[ShortRentDetailController alloc] init];
    ShortRentViewModel *model = (ShortRentViewModel *)self.model;
    shortRentDetailController.title = model.houseName;
    shortRentDetailController.guid = model.guid;
    
    [self.controller.navigationController pushViewController:shortRentDetailController animated:YES];
}

- (UILabel *)numOfRoomLabel{
    if (nil == _numOfRoomLabel) {
        UILabel *numOfRoomLabel = [[UILabel alloc] init];
        numOfRoomLabel.backgroundColor = [UIColor orangeColor];
        numOfRoomLabel.text = @"房号";
        [self addSubview:numOfRoomLabel];
        _numOfRoomLabel = numOfRoomLabel;
    }
    return _numOfRoomLabel;
}

- (UILabel *)numOfRoom{
    if (nil == _numOfRoom) {
        UILabel *numOfRoom = [[UILabel alloc] init];
        numOfRoom.backgroundColor = [UIColor orangeColor];
        [self addSubview:numOfRoom];
        _numOfRoom = numOfRoom;
    }
    return _numOfRoom;
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


- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)weeklyLabel{
    if (nil == _weeklyLabel) {
        UILabel *weeklyLabel = [[UILabel alloc] init];
        weeklyLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:weeklyLabel];
        _weeklyLabel = weeklyLabel;
    }
    return _weeklyLabel;
}

- (UILabel *)addressLabel{
    if (nil == _addressLabel) {
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{
    ShortRentViewModel *model = [ShortRentViewModel modelWithDictionary:data];
    self.model = model;
    
//    @property (weak, nonatomic) UILabel *numOfRoomLabel;
//    @property (weak, nonatomic) UILabel *numOfRoom;
//    @property (weak, nonatomic) UIImageView *backImage;
//    
//    @property (weak, nonatomic) UILabel *titleLabel;
//    @property (weak, nonatomic) UILabel *houseTypeLabel;
//    @property (weak, nonatomic) UILabel *weeklyLabel;
//    @property (weak, nonatomic) UILabel *addressLabel;
//    @property (weak, nonatomic) UILabel *priceLabel;
    [self.backImage lfSetImageWithURL:model.houseImageGuid[0]];
    self.numOfRoom.text = [NSString stringWithFormat:@"%@",model.houseNumber];
    self.titleLabel.text = model.houseName;
    self.houseTypeLabel.text = [NSString stringWithFormat:@"房型：%@",model.houseType];
    self.weeklyLabel.text = [NSString stringWithFormat:@"周次：%@",model.houseWeek];
    self.addressLabel.text = [NSString stringWithFormat:@"地址：%@",model.address];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
}
@end
