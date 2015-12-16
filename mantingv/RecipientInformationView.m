//
//  RecipientInformationView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RecipientInformationView.h"
@interface RecipientInformationView ()
@property (nonatomic,weak) UILabel *recipientsLabel;
@property (nonatomic,weak) UILabel *phoneNumberLabel;
@property (nonatomic,weak) UILabel *addressLabel;
@end
@implementation RecipientInformationView

//设置约束
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    //收件人
    [self.recipientsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 顶部 10
        make.top.equalTo(superView).with.offset(10);
        
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
    }];
    
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 顶部 10
        make.top.equalTo(superView).with.offset(10);
        
        //距 self.recipientsLabel 右边 10
        make.left.equalTo(self.recipientsLabel.mas_right).with.offset(10);
    }];
    
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //距 父视图 左边 5
        make.left.equalTo(superView).with.offset(5);
        
        //距 self.recipientsLabel 底部 10
        make.top.equalTo(self.recipientsLabel.mas_bottom).with.offset(10);
    }];
}

- (UILabel *)recipientsLabel{
    if(nil == _recipientsLabel){
        UILabel *recipientLabel = [[UILabel alloc] init];
        recipientLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:recipientLabel];
        _recipientsLabel = recipientLabel;
    }
    return _recipientsLabel;
}

- (UILabel *)phoneNumberLabel{
    if(nil == _phoneNumberLabel){
        UILabel *phoneNumberLabel = [[UILabel alloc] init];
        phoneNumberLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:phoneNumberLabel];
        _phoneNumberLabel = phoneNumberLabel;
    }
    return _phoneNumberLabel;
}

- (UILabel *)addressLabel{
    if(nil == _addressLabel){
        UILabel *addressLabel = [[UILabel alloc] init];
        addressLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}


- (void)setValueWith:(id)data{
    self.recipientsLabel.text = @"收件人：刘丰";
    self.phoneNumberLabel.text = @"电话号码：123456";
    self.addressLabel.text = @"地址：四川省";
}
@end
