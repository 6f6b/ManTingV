//
//  MTPayContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTPayContentScrollView.h"

#import "MTPayController.h"
#import "OrderView.h"
#import "FreightView.h"
#import "LeaveWordView.h"
#import "PurchaseAgreementView.h"
#import "PayTypeView.h"

@interface MTPayContentScrollView ()
@property (nonatomic,weak) OrderView *orderView;
@property (nonatomic,weak) FreightView *freightView;
@property (nonatomic,weak) LeaveWordView *leaveWordView;
@property (nonatomic,weak) PurchaseAgreementView *purchaseAgreementView;
@property (nonatomic,weak) PayTypeView *payTypeView;
@end
@implementation MTPayContentScrollView

//设置约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];

    
    //订单
    self.orderView.frame = CGRectMake(0, 90, SCREEN_WIDTH, 200);

    
    //购买数量
    self.purchaseQuantityView.frame = CGRectMake(0, CGRectGetMaxY(self.orderView.frame)+10, SCREEN_WIDTH, 50);

    
    //运费
    self.freightView.frame = CGRectMake(0, CGRectGetMaxY(self.purchaseQuantityView.frame)+10, SCREEN_WIDTH, 50);

    
    //留言
    self.leaveWordView.frame = CGRectMake(0, CGRectGetMaxY(self.freightView.frame)+20, SCREEN_WIDTH, 50);
    
    //合同
    self.purchaseAgreementView.frame = CGRectMake(0, CGRectGetMaxY(self.leaveWordView.frame)+20, SCREEN_WIDTH, 50);

    
    //支付类型
    self.payTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.purchaseAgreementView.frame)+20, SCREEN_WIDTH, 50);
    
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.payTypeView.frame)+50);

}

- (AddressContentView *)addressContentView{
    if (nil == _addressContentView) {
        AddressContentView *addressContentView = [[AddressContentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        addressContentView.controller = self.controller;
        addressContentView.backgroundColor = [UIColor greenColor];
        [self addSubview:addressContentView];
        _addressContentView = addressContentView;
    }
    return _addressContentView;
}

- (OrderView *)orderView{
    if (nil == _orderView) {
        OrderView *orderView = [[OrderView alloc] init];
        orderView.backgroundColor = [UIColor greenColor];
        [self addSubview:orderView];
        _orderView = orderView;
    }
    return _orderView;
}

- (PurchaseQuantityView *)purchaseQuantityView{
    if (nil == _purchaseQuantityView) {
        PurchaseQuantityView *purchaseQuantityView = [[PurchaseQuantityView alloc] init];
        purchaseQuantityView.controller = self.controller;
        purchaseQuantityView.backgroundColor = [UIColor greenColor];
        [self addSubview:purchaseQuantityView];
        _purchaseQuantityView = purchaseQuantityView;
    }
    return _purchaseQuantityView;
}

- (FreightView *)freightView{
    if (nil == _freightView) {
        FreightView *freightView = [[FreightView alloc] init];
        freightView.backgroundColor = [UIColor greenColor];
        [self addSubview:freightView];
        _freightView = freightView;
    }
    return _freightView;
}

- (LeaveWordView *)leaveWordView{
    if (nil == _leaveWordView) {
        LeaveWordView *leaveWordView = [[LeaveWordView alloc] init];
        leaveWordView.backgroundColor = [UIColor greenColor];
        [self addSubview:leaveWordView];
        _leaveWordView = leaveWordView;
    }
    return _leaveWordView;
}

- (PurchaseAgreementView *)purchaseAgreementView{
    if (nil == _purchaseAgreementView) {
        PurchaseAgreementView *purchaseAgreementView = [[PurchaseAgreementView alloc] init];
        purchaseAgreementView.controller = self.controller;
        purchaseAgreementView.backgroundColor = [UIColor greenColor];
        [self addSubview:purchaseAgreementView];
        _purchaseAgreementView = purchaseAgreementView;
    }
    return _purchaseAgreementView;
}

- (PayTypeView *)payTypeView{
    if (nil == _payTypeView) {
        PayTypeView *payTypeView = [[PayTypeView alloc] init];
        payTypeView.backgroundColor = [UIColor greenColor];
        [self addSubview:payTypeView];
        _payTypeView = payTypeView;
    }
    return _payTypeView;
}

- (void)setValueWith:(id)data{
    MTPayController *payController = self.controller;
    
    //刷新控件数据
    [self.addressContentView setValueWith:nil];
    [self.orderView setValueWith:data];
}
@end
