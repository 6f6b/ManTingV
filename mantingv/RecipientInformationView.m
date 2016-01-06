//
//  RecipientInformationView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RecipientInformationView.h"
#import "AddressDTOModel.h"
#import "AddressListController.h"
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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)];
    [self addGestureRecognizer:tap];
}

- (UILabel *)recipientsLabel{
    if(nil == _recipientsLabel){
        UILabel *recipientLabel = [[UILabel alloc] init];
        [self addSubview:recipientLabel];
        _recipientsLabel = recipientLabel;
    }
    return _recipientsLabel;
}

- (UILabel *)phoneNumberLabel{
    if(nil == _phoneNumberLabel){
        UILabel *phoneNumberLabel = [[UILabel alloc] init];
        [self addSubview:phoneNumberLabel];
        _phoneNumberLabel = phoneNumberLabel;
    }
    return _phoneNumberLabel;
}

- (UILabel *)addressLabel{
    if(nil == _addressLabel){
        UILabel *addressLabel = [[UILabel alloc] init];
        [self addSubview:addressLabel];
        _addressLabel = addressLabel;
    }
    return _addressLabel;
}

- (void)setValueWith:(id)data{
    AddressDTOModel *model = [AddressDTOModel modelWithDictionary:data];
    
    self.recipientsLabel.text = [NSString stringWithFormat:@"收件人：%@",model.username];
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"电话号码：%@",model.phoneNum];
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@%@%@",model.province,model.city,model.district,model.area];
}

- (void)dealTap{
    AddressListController *addressListController = [[AddressListController alloc] init];
    [self.controller.navigationController pushViewController:addressListController animated:YES];
}
@end
