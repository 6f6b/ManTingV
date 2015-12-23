//
//  MTPayContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTPayContentScrollView.h"

#import "AddAddressView.h"
#import "RecipientInformationView.h"
#import "OrderView.h"
#import "PurchaseQuantityView.h"
#import "FreightView.h"
#import "LeaveWordView.h"
#import "PurchaseAgreementView.h"
#import "PayTypeView.h"

@interface MTPayContentScrollView ()
@property (nonatomic,weak) AddAddressView *addAddressView;
@property (nonatomic,weak) RecipientInformationView *recipientInformationView;
@property (nonatomic,weak) OrderView *orderView;
@property (nonatomic,weak) PurchaseQuantityView *purchaseQuantityView;
@property (nonatomic,weak) FreightView *freightView;
@property (nonatomic,weak) LeaveWordView *leaveWordView;
@property (nonatomic,weak) PurchaseAgreementView *purchaseAgreementView;
@property (nonatomic,weak) PayTypeView *payTypeView;
@end
@implementation MTPayContentScrollView

//设置约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];    
    //添加地址
    self.addAddressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
    
    
    //收件人信息
    self.recipientInformationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);

    
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

- (AddAddressView *)addAddressView{
    if (nil == _addAddressView) {
        AddAddressView *addAddressView = [[AddAddressView alloc] init];
        addAddressView.backgroundColor = [UIColor greenColor];
        [self addSubview:addAddressView];
        _addAddressView = addAddressView;
    }
    return _addAddressView;
}

- (RecipientInformationView *)recipientInformationView{
    if (nil == _recipientInformationView) {
        RecipientInformationView *recipientInformationView = [[RecipientInformationView alloc] init];
        recipientInformationView.backgroundColor = [UIColor greenColor];
        [self addSubview:recipientInformationView];
        _recipientInformationView = recipientInformationView;
    }
    return _recipientInformationView;
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
    //刷新控件数据
    [self.recipientInformationView setValueWith:nil];
    [self.orderView setValueWith:nil];
}
@end
