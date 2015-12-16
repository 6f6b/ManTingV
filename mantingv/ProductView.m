//
//  ProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductView.h"

@implementation ProductView

//@property (nonatomic,weak) UIImageView *backImage;
//@property (nonatomic,weak) UILabel *priceLabel;
//@property (nonatomic,weak) UILabel *titleLabel;
//@property (nonatomic,weak) UILabel *seeDetailLabel;
//@property (nonatomic,weak) UILabel *houseTypeAndSizeLabel;

- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    //backImage
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 父视图 右边 5
        make.right.equalTo(superView).with.offset(-5);
        
        //距 父视图 上边 5
        make.top.equalTo(superView).with.offset(5);
    }];
    
    //priceLabel
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 titleLabel 上边 10
        make.bottom.equalTo(self.titleLabel.mas_top).with.offset(-10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 backImage 下边 5
        make.top.equalTo(self.backImage.mas_bottom).with.offset(5);
    }];
    
    [self.seeDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 右边 5
        make.right.equalTo(superView).with.offset(-5);
        
        //距 backImage 下边 5
        make.top.equalTo(self.backImage.mas_bottom).with.offset(5);
    }];
    
    [self.houseTypeAndSizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 父视图 底边 0
        make.bottom.equalTo(superView);
        
        //距 titleLabel 下边 5
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
    }];
    
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.backgroundColor = [UIColor grayColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
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

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)seeDetailLabel{
    if (nil == _seeDetailLabel) {
        UILabel *seeDetailLabel = [[UILabel alloc] init];
        seeDetailLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:seeDetailLabel];
        _seeDetailLabel = seeDetailLabel;
    }
    return _seeDetailLabel;
}

- (UILabel *)houseTypeAndSizeLabel{
    if (nil == _houseTypeAndSizeLabel) {
        UILabel *houseTypeAndSizeLabel = [[UILabel alloc] init];
        houseTypeAndSizeLabel.font = [UIFont systemFontOfSize:12];
        houseTypeAndSizeLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:houseTypeAndSizeLabel];
        _houseTypeAndSizeLabel = houseTypeAndSizeLabel;
    }
    return _houseTypeAndSizeLabel;
}

- (void)setValueWith:(id)data{
    self.backImage.backgroundColor = [UIColor greenColor];
    self.priceLabel.text = @"1200元／份起";
    self.titleLabel.text = @"太湖";
    self.houseTypeAndSizeLabel.text = @"三居室／121.97平米";
    self.seeDetailLabel.text = @"查看详情";
}
@end
