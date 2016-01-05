//
//  MyHouseListDetailDescriptionView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyHouseListDetailDescriptionView.h"
#import "MyHouseListModel.h"
#import "HouseInfoDTOModel.h"
#import "HouseWeekDTOModel.h"

@interface MyHouseListDetailDescriptionView ()
@property (nonatomic,weak) UILabel *sizeAndTitleAndWeekLabel;
@property (nonatomic,weak) UILabel *earnestLabel;
@property (nonatomic,weak) UILabel *earnest;
@property (nonatomic,weak) UILabel *priceLabel;
@property (nonatomic,weak) UILabel *soldNumLabel;
@end

@implementation MyHouseListDetailDescriptionView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.sizeAndTitleAndWeekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        make.left.equalTo(superView).with.offset(10);
    }];
    
    [self.earnestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sizeAndTitleAndWeekLabel.mas_bottom);
        make.left.equalTo(superView).with.offset(10);
    }];
    
    [self.earnest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sizeAndTitleAndWeekLabel.mas_bottom);
        make.left.equalTo(self.earnestLabel.mas_right);

    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superView);
        make.top.equalTo(self.sizeAndTitleAndWeekLabel.mas_bottom);
    }];
    
    [self.soldNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).with.offset(-10);
        make.top.equalTo(self.sizeAndTitleAndWeekLabel.mas_bottom);
    }];
}

- (UILabel *)sizeAndTitleAndWeekLabel{
    if (nil == _sizeAndTitleAndWeekLabel) {
        UILabel *sizeAndTitleAndWeekLabel = [[UILabel alloc] init];
        [self addSubview:sizeAndTitleAndWeekLabel];
        _sizeAndTitleAndWeekLabel = sizeAndTitleAndWeekLabel;
    }
    return _sizeAndTitleAndWeekLabel;
}

- (UILabel *)earnestLabel{
    if (nil == _earnestLabel) {
        UILabel *earnestLabel = [[UILabel alloc] init];
        [self addSubview:earnestLabel];
        _earnestLabel = earnestLabel;
    }
    return _earnestLabel;
}

- (UILabel *)earnest{
    if (nil == _earnest) {
        UILabel *earnest = [[UILabel alloc] init];
        [self addSubview:earnest];
        _earnest = earnest;
    }
    return _earnest;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (UILabel *)soldNumLabel{
    if (nil == _soldNumLabel) {
        UILabel *soldNumLabel = [[UILabel alloc] init];
        [self addSubview:soldNumLabel];
        _soldNumLabel = soldNumLabel;
    }
    return _soldNumLabel;
}

- (void)setValueWith:(id)data{
    MyHouseListModel *myHouseListModel = data;
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:myHouseListModel.houseInfoDTO];
    HouseWeekDTOModel *houseWeekDTOModel = [HouseWeekDTOModel modelWithDictionary:myHouseListModel.houseWeekDTO];
    
    self.sizeAndTitleAndWeekLabel.text = [NSString stringWithFormat:@"%@㎡%@%@",houseInfoDTOModel.buildingTypeArea,houseInfoDTOModel.name,houseWeekDTOModel.name];
    self.earnestLabel.text = @"定金";
    self.earnest.text = houseInfoDTOModel.price;
    self.priceLabel.text = houseWeekDTOModel.price;
    self.soldNumLabel.text = [NSString stringWithFormat:@"销量：%@",houseWeekDTOModel.soldNum];
}
@end
