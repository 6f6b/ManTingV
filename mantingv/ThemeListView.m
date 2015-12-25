//
//  ThemeListView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListView.h"
#import "MTPayController.h"
#import "ThemeListViewModel.h"

@implementation ThemeListView

#pragma  mark - 创建约束

- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 上边 10
        make.top.equalTo(superView).with.offset(10);
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        //距 父视图 下边 10
        make.bottom.equalTo(superView).with.offset(-10);
        //宽 限定为 50
        make.width.equalTo(@50);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 上边距 0
        make.top.equalTo(self.backImage);
        //距 self.backImage 右边距 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);
        

    }];
    
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 右边距 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);
        //距 self.timeLabel 下边距 0
        make.top.equalTo(self.timeLabel.mas_bottom);

    }];
    
    [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.backImage 右边距 5
        make.left.equalTo(self.backImage.mas_right).with.offset(5);
        //距 self.houseTypeLabel 下边距 0
        make.top.equalTo(self.houseTypeLabel.mas_bottom);
        

    }];
    
    [self.surplusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.sizeLabel 右边距 5
        make.left.equalTo(self.sizeLabel.mas_right).with.offset(5);
        //距 self.sizeLabel 上边距 0
        make.top.equalTo(self.sizeLabel);
        

    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 右边距 30
        make.right.equalTo(superView).with.offset(-10);
        //距 self.timeLabel 上边距 0
        make.top.equalTo(self.timeLabel);
        

    }];
    
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 self.sizeLabel 底边 0
        make.bottom.equalTo(self.sizeLabel);
        //距 父视图 右边距 10
        make.right.equalTo(superView).with.offset(-10);
        //宽 为 40
        make.width.equalTo(@50);
        //高 为 25
        make.height.equalTo(@25);
    }];
}

#pragma mark - 懒加载控件
- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.image = [UIImage imageNamed:@"mine"];
        backImage.backgroundColor = [UIColor grayColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UILabel *)timeLabel{
    if (nil == _timeLabel) {
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.backgroundColor = [UIColor orangeColor];
        timeLabel.font = [UIFont systemFontOfSize:12];
        timeLabel.text = @"时间";
        [self addSubview:timeLabel];
        _timeLabel = timeLabel;
    }
    return _timeLabel;
}

- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.font = [UIFont systemFontOfSize:12];
        houseTypeLabel.text = @"一室一厅";
        houseTypeLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)sizeLabel{
    if (nil == _sizeLabel) {
        UILabel *sizeLabel = [[UILabel alloc] init];
        sizeLabel.text = @"100平米";
        sizeLabel.font = [UIFont systemFontOfSize:12];
        sizeLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:sizeLabel];
        _sizeLabel = sizeLabel;
    }
    return _sizeLabel;
}

- (UILabel *)surplusLabel{
    if (nil == _surplusLabel) {
        UILabel *surplusLabel = [[UILabel alloc] init];
        surplusLabel.backgroundColor = [UIColor yellowColor];
        surplusLabel.text = @"剩余100套";
        surplusLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:surplusLabel];
        _surplusLabel = surplusLabel;
    }
    return _surplusLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.text = @"20万";
        priceLabel.font = [UIFont systemFontOfSize:12];
        priceLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (UIButton *)buyButton{
    if (nil == _buyButton) {
        UIButton *buyBUtton = [UIButton buttonWithType:UIButtonTypeCustom];
        buyBUtton.titleLabel.font = [UIFont systemFontOfSize:12];
        buyBUtton.tintColor = [UIColor whiteColor];
        [buyBUtton setTitle:@"立即购买" forState:UIControlStateNormal];
        [buyBUtton addTarget:self action:@selector(dealBuyBtn) forControlEvents:UIControlEventTouchUpInside];
        buyBUtton.backgroundColor = [UIColor redColor];
        [self addSubview:buyBUtton];
        _buyButton = buyBUtton;
    }
    return _buyButton;
}

- (void)dealBuyBtn{
    NSLog(@"购买");
    MTPayController *payController = [[MTPayController alloc] init];
    payController.title = @"支付";
    
    MTBaseView *themeListContentView =  (MTBaseView *)self.superview;
    [themeListContentView.controller.navigationController pushViewController:payController animated:YES];
}

- (void)setValueWith:(id)data{
//    @property (nonatomic,weak) UIImageView *backImage;
//    @property (nonatomic,weak) UILabel *timeLabel;
//    @property (nonatomic,weak) UILabel *houseTypeLabel;
//    @property (nonatomic,weak) UILabel *sizeLabel;
//    @property (nonatomic,weak) UILabel *surplusLabel;
//    @property (nonatomic,weak) UILabel *priceLabel;
//    @property (nonatomic,weak) UIButton *buyButton;
    
    ThemeListViewModel *model = [ThemeListViewModel modelWithDictionary:data];
    [self.backImage lfSetImageWithURL:self.imageUrl];
    self.timeLabel.text = [NSString stringWithFormat:@"周期：%@",model.name];
    self.houseTypeLabel.text = [NSString stringWithFormat:@"房型：%@",self.houseType];
    self.sizeLabel.text = [NSString stringWithFormat:@"面积：%@",self.buildingSize];
    self.surplusLabel.text = [NSString stringWithFormat:@"剩余%@份",model.fee];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    
}

@end
