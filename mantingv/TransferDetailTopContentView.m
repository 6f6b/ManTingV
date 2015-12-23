//
//  TransferDetailTopContentView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferDetailTopContentView.h"

@interface TransferDetailTopContentView ()
@property (nonatomic,weak) LFLoopScrollView *pictureScrollView;
@property (nonatomic,weak) UILabel *houseTypeLabel;
@property (nonatomic,weak) UILabel *cycleLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@property (nonatomic,weak) UILabel *price;
@end
@implementation TransferDetailTopContentView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.pictureScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        
        make.height.equalTo(@150);
    }];
    
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureScrollView.mas_bottom).with.offset(2);
        make.left.equalTo(superView).with.offset(10);
    }];
    
    [self.cycleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureScrollView.mas_bottom).with.offset(2);
        make.left.equalTo(self.houseTypeLabel.mas_right).with.offset(5);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureScrollView.mas_bottom).with.offset(2);
        make.right.equalTo(self.price.mas_left).with.offset(-10);
    }];
    
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pictureScrollView.mas_bottom).with.offset(2);
        make.right.equalTo(superView).with.offset(-10);
    }];
}

- (LFLoopScrollView *)pictureScrollView{
    if (nil == _pictureScrollView) {
        LFLoopScrollView *pictureScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
        [self addSubview:pictureScrollView];
        _pictureScrollView = pictureScrollView;
    }
    return _pictureScrollView;
}


- (UILabel *)houseTypeLabel{
    if (nil == _houseTypeLabel) {
        UILabel *houseTypeLabel = [[UILabel alloc] init];
        houseTypeLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:houseTypeLabel];
        _houseTypeLabel = houseTypeLabel;
    }
    return _houseTypeLabel;
}

- (UILabel *)cycleLabel{
    if (nil == _cycleLabel) {
        UILabel *cycleLabel = [[UILabel alloc] init];
        cycleLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:cycleLabel];
        _cycleLabel = cycleLabel;
    }
    return _cycleLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (UILabel *)price{
    if (nil == _price) {
        UILabel *price = [[UILabel alloc] init];
        price.backgroundColor = [UIColor grayColor];
        price.textColor = [UIColor redColor];
        [self addSubview:price];
        _price = price;
    }
    return _price;
}

- (void)setValueWith:(id)data{
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.pictureScrollView setImageWithUrlS:urls];
    
    self.houseTypeLabel.text = @"两室一厅/90平米";
    self.cycleLabel.text = @"淡季周";
    self.priceLabel.text = @"价格:";
    self.price.text = @"￥345";
}
@end
