//
//  PayTypeView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "PayTypeView.h"

@interface PayTypeView ()
@property (nonatomic,weak) UIImageView *payTypeImage;
@property (nonatomic,weak) UILabel *payTypeLabel;
@property (nonatomic,weak) UILabel *otherLabel;
@property (nonatomic,weak) UIImageView *selectImage;
@end
@implementation PayTypeView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.payTypeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
        
        //高 50
        make.height.equalTo(@45);
        
        //宽 50
        make.width.equalTo(@45);
    }];
    
    [self.payTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //距 父视图 顶部 5
        make.top.equalTo(superView).with.offset(5);
        
        //距 self.payTypeImage 右侧 5
        make.left.equalTo(self.payTypeImage.mas_right).with.offset(5);
    }];
    
    [self.otherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //距 self.payTypeLabel 底部 5
        make.top.equalTo(self.payTypeLabel.mas_bottom).with.offset(5);
        
        //距 self.payTypeImage 右侧 5
        make.left.equalTo(self.payTypeImage.mas_right).with.offset(5);
    }];
    
    [self.selectImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 右侧 5
        make.right.equalTo(superView).with.offset(-5);
        
        //宽 20
        make.width.equalTo(@20);
        
        //高 20
        make.height.equalTo(@20);
    }];

}

- (UIImageView *)payTypeImage{
    if (nil == _payTypeImage) {
        UIImageView *payTypeImage = [[UIImageView alloc] init];
        payTypeImage.image = [[UIImage imageNamed:@"alipay_72px_1186722_easyicon.net"] stretchableImageWithLeftCapWidth:-10 topCapHeight:10];

        //payTypeImage.backgroundColor = [UIColor redColor];
        [self addSubview:payTypeImage];
        _payTypeImage = payTypeImage;
    }
    return _payTypeImage;
}

- (UILabel *)payTypeLabel{
    if (nil == _payTypeLabel) {
        UILabel *payTypeLabel = [[UILabel alloc] init];
        payTypeLabel.text = @"支付宝钱包支付";
        [self addSubview:payTypeLabel];
        _payTypeLabel = payTypeLabel;
    }
    return _payTypeLabel;
}

- (UILabel *)otherLabel{
    if (nil == _otherLabel) {
        UILabel *otherLabel = [[UILabel alloc] init];
        otherLabel.text = @"推荐支付宝用户使用";
        [self addSubview:otherLabel];
        _otherLabel = otherLabel;
    }
    return _otherLabel;
}

- (UIImageView *)selectImage{
    if (nil == _selectImage) {
        UIImageView *selectImage = [[UIImageView alloc] init];
        selectImage.backgroundColor = [UIColor redColor];
        [self addSubview:selectImage];
        _selectImage = selectImage;
    }
    return _selectImage;
}
@end
