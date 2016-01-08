//
//  ShortRentPriceView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentPriceView.h"
#import "BookOrderController.h"
#import "ShortRentDetailContentScrollViewModel.h"

@interface ShortRentPriceView ()
@property (nonatomic,weak) UILabel *retailPriceLabel;
@property (nonatomic,weak) UILabel *retailPrice;

@property (nonatomic,weak) UILabel *memberPriceLabel;
@property (nonatomic,weak) UILabel *memberPrice;

@property (nonatomic,weak) UIView *segementationA;
@property (nonatomic,weak) UIView *segementationB;

@property (nonatomic,weak) UIButton *immediateBookButton;
@end
@implementation ShortRentPriceView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //零售价标签
    [self.retailPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        
        make.left.equalTo(superView);
        
        make.right.equalTo(self.segementationA.mas_left);
    }];

    //零售价
    [self.retailPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.retailPriceLabel.mas_bottom).with.offset(10);
        
        make.left.equalTo(superView);
        
        make.right.equalTo(self.segementationA.mas_left);
    }];

    //会员价标签
    [self.memberPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).with.offset(10);
        
        make.left.equalTo(self.segementationA.mas_right);
        
        make.right.equalTo(self.segementationB.mas_left);
    }];

    //会员价
    [self.memberPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.memberPriceLabel.mas_bottom).with.offset(10);
        
        make.left.equalTo(self.segementationA.mas_right);
        
        make.right.equalTo(self.segementationB.mas_left);
    }];
    
    //分割线A
    [self.segementationA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);
        
        make.top.equalTo(superView).with.offset(5);
        
        make.bottom.equalTo(superView).with.offset(-5);
        
        make.left.equalTo(superView).with.offset(SCREEN_WIDTH/3);
    }];
    
    //分割线B
    [self.segementationB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@1);

        make.top.equalTo(superView).with.offset(5);
        
        make.bottom.equalTo(superView).with.offset(-5);
        
        make.right.equalTo(superView).with.offset(-SCREEN_WIDTH/3);

    }];
    
    //立即预订 按钮
    [self.immediateBookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).with.offset(-10);
        
        make.centerY.equalTo(superView);
        
        make.width.equalTo(@80);
        
        make.height.equalTo(@30);
    }];
}

- (UILabel *)retailPriceLabel{
    if (nil == _retailPriceLabel) {
        UILabel *retailPriceLabel = [[UILabel alloc] init];
        retailPriceLabel.backgroundColor = [UIColor greenColor];
        retailPriceLabel.textAlignment = NSTextAlignmentCenter;
        retailPriceLabel.text = @"零售价";
        [self addSubview:retailPriceLabel];
        _retailPriceLabel = retailPriceLabel;
    }
    return _retailPriceLabel;
}

- (UILabel *)retailPrice{
    if (nil == _retailPrice) {
        UILabel *retailPrice = [[UILabel alloc] init];
        retailPrice.backgroundColor = [UIColor greenColor];
        retailPrice.textAlignment = NSTextAlignmentCenter;
        retailPrice.text = @"零售价";
        [self addSubview:retailPrice];
        _retailPrice = retailPrice;
    }
    return _retailPrice;
}


- (UILabel *)memberPriceLabel{
    if (nil == _memberPriceLabel) {
        UILabel *memberPriceLabel = [[UILabel alloc] init];
        memberPriceLabel.backgroundColor = [UIColor greenColor];
        memberPriceLabel.textAlignment = NSTextAlignmentCenter;
        memberPriceLabel.text = @"会员价";
        [self addSubview:memberPriceLabel];
        _memberPriceLabel = memberPriceLabel;
    }
    return _memberPriceLabel;
}

- (UILabel *)memberPrice{
    if (nil == _memberPrice) {
        UILabel *memberPrice = [[UILabel alloc] init];
        memberPrice.backgroundColor = [UIColor greenColor];
        memberPrice.textAlignment = NSTextAlignmentCenter;
        memberPrice.text = @"会员价";
        [self addSubview:memberPrice];
        _memberPrice = memberPrice;
    }
    return _memberPrice;
}

- (UIView *)segementationA{
    if (nil == _segementationA) {
        UIView *segementationA = [[UIView alloc] init];
        segementationA.backgroundColor = [UIColor grayColor];
        [self addSubview:segementationA];
        _segementationA = segementationA;
    }
    return _segementationA;
}

- (UIView *)segementationB{
    if (nil == _segementationB) {
        UIView *segementationB = [[UIView alloc] init];
        segementationB.backgroundColor = [UIColor grayColor];
        [self addSubview:segementationB];
        _segementationB = segementationB;
    }
    return _segementationB;
}

- (UIButton *)immediateBookButton{
    if (nil == _immediateBookButton) {
        UIButton *immediateBookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        immediateBookButton.backgroundColor = [UIColor purpleColor];
//        [immediateBookButton setBackgroundColor:[UIColor redColor]];
        [immediateBookButton setTitle:@"立即预订" forState:UIControlStateNormal];
        [immediateBookButton addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:immediateBookButton];
        _immediateBookButton = immediateBookButton;
    }
    return _immediateBookButton;
}

- (void)dealBtn:(UIButton *)button{
    NSLog(@"%@",self.controller);
    BookOrderController *bookOrderController = [[BookOrderController alloc] init];
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)self.model;
    bookOrderController.earnestMoney = model.price;
    bookOrderController.rentGuid = model.guid;
    [self.controller.navigationController pushViewController:bookOrderController animated:YES];
}

- (void)setValueWith:(id)data{
    ShortRentDetailContentScrollViewModel *model = (ShortRentDetailContentScrollViewModel *)data;
    self.model = model;
//    @property (nonatomic,weak) UILabel *retailPriceLabel;
//    @property (nonatomic,weak) UILabel *retailPrice;
//    
//    @property (nonatomic,weak) UILabel *memberPriceLabel;
//    @property (nonatomic,weak) UILabel *memberPrice;
//    
//    @property (nonatomic,weak) UIView *segementationA;
//    @property (nonatomic,weak) UIView *segementationB;
    self.retailPrice.text = model.price;
    self.memberPrice.text = model.price;
    
    
}
@end
