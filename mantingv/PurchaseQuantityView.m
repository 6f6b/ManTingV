//
//  PurchaseQuantityView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "PurchaseQuantityView.h"
#import "MTPayController.h"
@interface PurchaseQuantityView ()
@property (nonatomic,weak) UILabel *purchaseQuantityLabel;
@property (nonatomic,weak) UILabel *purchaseQuantityShowLabel;
@end
@implementation PurchaseQuantityView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.purchaseQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
    }];
    
    [self.purchaseQuantityStepper mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 右侧 5
        make.right.equalTo(superView).with.offset(-5);
    }];
    
    [self.purchaseQuantityShowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 self.purchaseQuantityStepper 左侧 5
        make.right.equalTo(self.purchaseQuantityStepper.mas_left).with.offset(-5);
    }];
}

- (UILabel *)purchaseQuantityLabel{
    if (nil == _purchaseQuantityLabel) {
        UILabel *purchaseQuantityLabel = [[UILabel alloc] init];
        purchaseQuantityLabel.text = @"购买数量";
        [self addSubview:purchaseQuantityLabel];
        _purchaseQuantityLabel = purchaseQuantityLabel;
    }
    return _purchaseQuantityLabel;
}


- (UIStepper *)purchaseQuantityStepper{
    if(nil == _purchaseQuantityStepper){
        UIStepper *purchaseQuantityStepper = [[UIStepper alloc] init];
        [purchaseQuantityStepper addTarget:self action:@selector(dealPurchaseQuantityStepper:) forControlEvents:UIControlEventValueChanged];
        purchaseQuantityStepper.minimumValue = 1;
        purchaseQuantityStepper.backgroundColor = [UIColor whiteColor];
        [self addSubview:purchaseQuantityStepper];
        _purchaseQuantityStepper = purchaseQuantityStepper;
    }
    return _purchaseQuantityStepper;
}

- (UILabel *)purchaseQuantityShowLabel{
    if (nil == _purchaseQuantityShowLabel) {
        UILabel *purchaseQuantityShowLabel = [[UILabel alloc] init];
        purchaseQuantityShowLabel.backgroundColor = [UIColor yellowColor];
        purchaseQuantityShowLabel.text = [NSString stringWithFormat:@"%d",(int)self.purchaseQuantityStepper.value];
        [self addSubview:purchaseQuantityShowLabel];
        _purchaseQuantityShowLabel = purchaseQuantityShowLabel;
    }
    return _purchaseQuantityShowLabel;
}

- (void)dealPurchaseQuantityStepper:(UIStepper *)stepper{
    self.purchaseQuantityShowLabel.text = [NSString stringWithFormat:@"%d",(int)stepper.value];
    MTPayController *payController = self.controller;
    double totalPrice = stepper.value*[payController.themeListViewModel.price doubleValue];
    payController.totalPrice = totalPrice;
}
@end
