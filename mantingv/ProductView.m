//
//  ProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductView.h"
#import "ProductViewModel.h"

@implementation ProductView

//@property (nonatomic,weak) UIImageView *backImage;
//@property (nonatomic,weak) UILabel *priceLabel;
//@property (nonatomic,weak) UILabel *titleLabel;
//@property (nonatomic,weak) UILabel *seeDetailLabel;
//@property (nonatomic,weak) UILabel *houseTypeAndSizeLabel;

- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.backgroundColor = [UIColor greenColor];
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
        
        make.bottom.equalTo(superView).with.offset(-20);
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
    ProductViewModel *model = [ProductViewModel modelWithDictionary:data];
//    NSLog(@"%@",data);
//    @property (nonatomic,copy) NSString *houseBaseGuid;
//    @property (nonatomic,copy) NSString *area;
//    @property (nonatomic,copy) NSString *personNum;
//    @property (nonatomic,copy) NSString *buildingArea;
//    @property (nonatomic,copy) NSString *price;
//    @property (nonatomic,copy) NSString *extraArea;
//    @property (nonatomic,copy) NSString *houseType;
//    @property (nonatomic,copy) NSArray *houseInfoDTOs;
//    @property (nonatomic,copy) NSArray *imageGuids;
//    @property (nonatomic,copy) NSString *guid;
//    @property (nonatomic,copy) NSString *name;
    NSDictionary *dic = model.houseInfoDTOs[0];
    NSArray *imageGuids = [dic objectForKey:@"imageGuids"];
    
    [self.backImage lfSetImageWithURL:imageGuids[0]];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@/份起",model.price];
    self.titleLabel.text = model.name;
    self.houseTypeAndSizeLabel.text = [NSString stringWithFormat:@"%@/%@平米",model.houseType,model.area];
    self.seeDetailLabel.text = @"查看详情";

}
@end
