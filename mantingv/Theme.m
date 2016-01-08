//
//  Theme.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "Theme.h"
#import "ThemeModel.h"
#import "ThemeListController.h"
@interface Theme ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *bargainPriceLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@end
@implementation Theme

//创建子控件并创建约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    //backImage
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 四边 0
        make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //titleLabel
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 水平中心
        make.centerX.equalTo(superView);
        //距 父视图 底边 10
        make.bottom.equalTo(superView).with.offset(-10);
        
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    
    //barginPriceLabel
    [self.bargainPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 上边 0
        make.top.equalTo(superView);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        
        make.height.equalTo(self.priceLabel);
        make.width.equalTo(self.priceLabel);

    }];
    
    //priceLabel
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 bargainPriceLabel 下边 0
        make.top.equalTo(self.bargainPriceLabel.mas_bottom);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        
    }];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealThemeTap:)];
    [self addGestureRecognizer:tap];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
//        backImage.backgroundColor = [UIColor grayColor];
        [self addSubview:backImage];
        _backImage = backImage;
    }
    return _backImage;
}


- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)bargainPriceLabel{
    if (nil == _bargainPriceLabel) {
        UILabel *bargainPriceLabel = [[UILabel alloc] init];
        bargainPriceLabel.textColor = [UIColor whiteColor];
        bargainPriceLabel.backgroundColor = [UIColor colorWithRed:0.996 green:0.665 blue:0.166 alpha:1.000];
        [self addSubview:bargainPriceLabel];
        bargainPriceLabel.text = @"特价";
        _bargainPriceLabel = bargainPriceLabel;
    }
    return _bargainPriceLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.backgroundColor = [UIColor colorWithWhite:0.316 alpha:1.000];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

- (void)setValueWith:(id)data{
    
    ThemeModel *model = [ThemeModel modelWithDictionary:data];
    self.model = model;
    self.titleLabel.text = model.name;
    self.priceLabel.text = model.price;
    
    [self.backImage lfSetImageWithURL:model.imageGuids[0]];
}

- (void)dealThemeTap:(UITapGestureRecognizer *)tap{
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    ThemeModel *model = self.model;
    themeListController.guid = model.guid;
    
    [self.controller.navigationController pushViewController:themeListController animated:YES];
}
@end
