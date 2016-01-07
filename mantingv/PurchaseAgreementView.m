//
//  PurchaseAgreementView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "PurchaseAgreementView.h"
#import "AgreementController.h"
#import "MTPayController.h"

@interface PurchaseAgreementView ()
@property (nonatomic,weak) UILabel *purchaseAgreementLabel;
@property (nonatomic,weak) UILabel *previewLabel;
@property (nonatomic,weak) UIImageView *indicateImage;
@end
@implementation PurchaseAgreementView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.purchaseAgreementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 左侧 0
        make.left.equalTo(superView).with.offset(5);
    }];
    
    [self.previewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 self.indicateImage 左侧 0
        make.right.equalTo(self.indicateImage.mas_left).with.offset(-5);
    }];
    
    [self.indicateImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 右侧 5
        make.right.equalTo(superView).with.offset(-5);
        
        //高 20
        make.height.equalTo(@20);
        
        //宽 20
        make.width.equalTo(@20);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (UILabel *)purchaseAgreementLabel{
    if (nil == _purchaseAgreementLabel) {
        UILabel *purchaseAgreementLabel = [[UILabel alloc] init];
        purchaseAgreementLabel.text = @"同意购买合同";
        [self addSubview:purchaseAgreementLabel];
        _purchaseAgreementLabel = purchaseAgreementLabel;
    }
    return _purchaseAgreementLabel;
}

- (UILabel *)previewLabel{
    if (nil == _previewLabel) {
        UILabel *previewLabel = [[UILabel alloc] init];
        previewLabel.text = @"预览";
        [self addSubview:previewLabel];
        _previewLabel = previewLabel;
    }
    return _previewLabel;
}

- (UIImageView *)indicateImage{
    if (nil == _indicateImage) {
        UIImageView *indicateImage = [[UIImageView alloc] init];
        indicateImage.backgroundColor = [UIColor redColor];
        [self addSubview:indicateImage];
        _indicateImage = indicateImage;
    }
    return _indicateImage;
}

- (void)dealTap{
    AgreementController *agreementController = [[AgreementController alloc] init];
    MTPayController *payController = (MTPayController *)self.controller;
    NSLog(@"_______>%@",payController);
    agreementController.houseInfoGuid = payController.themeListViewModel.houseInfoGuid;
    [payController.navigationController pushViewController:agreementController animated:YES];
}
@end
