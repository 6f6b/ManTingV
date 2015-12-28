//
//  ChoiceRoom.m
//  mantingv
//
//  Created by LiuFeng on 15/12/18.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChoiceRoom.h"
#import "ChoiceRoomModel.h"
#import "ThemeListController.h"
@interface ChoiceRoom ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic,weak) UILabel *sizeLabel;
@property (nonatomic,weak) UILabel *priceLabel;
@end
@implementation ChoiceRoom

//加到父视图上面去的时候创建子控件并创建约束

- (void)willMoveToSuperview:(UIView *)newSuperview{
    UIView *superView = self;
    
    //创建背景图约束
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 上边 0
        make.top.equalTo(superView);
        //距 父视图 下边 20
        make.bottom.equalTo(superView).with.offset(-20);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        //距 父视图 右边 0
        make.right.equalTo(superView);
    }];
    
    //创建主题label约束
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 下边 20
        make.bottom.equalTo(superView).with.offset(-20);
        //距 父视图 左边 0
        make.left.equalTo(superView);
        //距 父视图 右边 0
        make.right.equalTo(superView);
        //高度 20
        make.height.equalTo(@20);
    }];
    
    //创建房间大小label约束
    [self.sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 0
        make.left.equalTo(superView);
        //距 父视图 下边 0
        make.bottom.equalTo(superView);
        //高度 15
        make.height.equalTo(@15);
        
        make.width.equalTo(@80);
        
    }];
    
    //创建价格label约束
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 右边 0
        make.right.equalTo(superView);
        //距 父视图 下边 0
        make.bottom.equalTo(superView);
        //高度 15
        make.height.equalTo(@15);
        
        make.width.equalTo(@80);
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self addGestureRecognizer:tap];
}

- (UIImageView *)backImage{
    if (nil == _backImage) {
        UIImageView *backImage = [[UIImageView alloc] init];
        backImage.backgroundColor = [UIColor redColor];
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

- (UILabel *)sizeLabel{
    if (nil == _sizeLabel) {
        UILabel *sizeLabel = [[UILabel alloc] init];
        sizeLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:sizeLabel];
        _sizeLabel = sizeLabel;
    }
    return _sizeLabel;
}

- (UILabel *)priceLabel{
    if (nil == _priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:priceLabel];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

//为子控件赋值
- (void)setValueWith:(id)data{
    ChoiceRoomModel *model = [ChoiceRoomModel modelWithDictionary:data];
    self.model = model;
    [self.backImage lfSetImageWithURL:model.imageGuids[0]];
    self.titleLabel.text = model.name;
    self.sizeLabel.text = model.houseType;
    self.priceLabel.text = model.price;
//    @property (nonatomic,weak) UIImageView *backImage;
//    @property (nonatomic,weak) UILabel *titleLabel;
//    @property (nonatomic,weak) UILabel *sizeLabel;
//    @property (nonatomic,weak) UILabel *priceLabel;
}


- (void)dealTap:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    ChoiceRoomModel *model = self.model;
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    themeListController.guid = model.guid;
    [self.controller.navigationController pushViewController:themeListController animated:YES];
}
@end
