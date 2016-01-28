//
//  ProductView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductView.h"
#import "ProductViewFatherModel.h"
#import "ProductViewModel.h"
#import "ThemeListController.h"


@implementation ProductView

//@property (nonatomic,weak) UIImageView *backImage;
//@property (nonatomic,weak) UILabel *priceLabel;
//@property (nonatomic,weak) UILabel *titleLabel;
//@property (nonatomic,weak) UILabel *seeDetailLabel;
//@property (nonatomic,weak) UILabel *houseTypeAndSizeLabel;

- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    self.backgroundColor = [UIColor whiteColor];
    UIView *superView = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self addGestureRecognizer:tap];
    
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
    
//    [self.houseWeekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        //距 父视图 左边 5
//        make.left.equalTo(superView).with.offset(5);
//        
//        //距 backImage 下边 5
//        make.top.equalTo(self.backImage.mas_bottom).with.offset(5);
//    }];
    
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
        backImage.clipsToBounds = YES;
        backImage.layer.cornerRadius = 3;
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor colorWithRed:0.054 green:0.027 blue:0.000 alpha:0.550];
        priceLabel.textColor = [UIColor whiteColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

//- (UILabel *)houseWeekLabel{
//    if (nil == _houseWeekLabel) {
//        UILabel *houseWeekLabel = [[UILabel alloc] init];
//        houseWeekLabel.backgroundColor = [UIColor whiteColor];
//        houseWeekLabel.textColor = [UIColor colorWithRed:(float)3/255 green:(float)167/255 blue:(float)156/255 alpha:1.000];
//        houseWeekLabel.font = [UIFont systemFontOfSize:14];
//        [self addSubview:houseWeekLabel];
//        _houseWeekLabel = houseWeekLabel;
//    }
//    return _houseWeekLabel;
//}

- (UILabel *)seeDetailLabel{
    if (nil == _seeDetailLabel) {
        UILabel *seeDetailLabel = [[UILabel alloc] init];
        seeDetailLabel.backgroundColor = [UIColor whiteColor];
        seeDetailLabel.textColor = [UIColor grayColor];
        seeDetailLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:seeDetailLabel];
        _seeDetailLabel = seeDetailLabel;
    }
    return _seeDetailLabel;
}

- (UILabel *)houseTypeAndSizeLabel{
    if (nil == _houseTypeAndSizeLabel) {
        UILabel *houseTypeAndSizeLabel = [[UILabel alloc] init];
        houseTypeAndSizeLabel.font = [UIFont systemFontOfSize:12];
        houseTypeAndSizeLabel.backgroundColor = [UIColor whiteColor];
        houseTypeAndSizeLabel.textColor = [UIColor grayColor];
        [self addSubview:houseTypeAndSizeLabel];
        _houseTypeAndSizeLabel = houseTypeAndSizeLabel;
    }
    return _houseTypeAndSizeLabel;
}

- (void)setValueWith:(id)data{
    ProductViewFatherModel *productViewFatherModel = [ProductViewFatherModel modelWithDictionary:data];
    //按照层级关系来讲，这一层应该为ProductView的数据，但由于服务器给的数据结构，我们不得不再向下剖析几层
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
    ProductViewModel *productViewModel = [ProductViewModel modelWithDictionary:productViewFatherModel.houseInfoDTOs[0]];
    self.model = productViewModel;
    
    [self.backImage lfSetImageWithURL:productViewModel.imageGuids[0]];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@/份起",productViewModel.price];
    self.titleLabel.text = productViewModel.name;
    self.houseTypeAndSizeLabel.text = [NSString stringWithFormat:@"%@/%@平米",productViewModel.houseType,productViewModel.buildingTypeArea];
    self.seeDetailLabel.text = @"查看详情";

}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    UIViewController *controller = self.controller;
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    ProductViewModel *model = (ProductViewModel *)self.model;
    themeListController.guid = model.guid;
    [controller.navigationController pushViewController:themeListController animated:YES];
}
@end
