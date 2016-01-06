//
//  AddAddressContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddAddressContentScrollView.h"

@implementation AddAddressContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.contactPersonEditView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150);
    self.contactAddressEditView.frame = CGRectMake(0, CGRectGetMaxY(self.contactPersonEditView.frame), SCREEN_WIDTH, 200);
}

- (ContactPersonEditView *)contactPersonEditView{
    if (nil == _contactPersonEditView) {
        ContactPersonEditView *contactPersonEditView = [[ContactPersonEditView alloc] init];
        contactPersonEditView.titleLabel.text = @"联系人";
        contactPersonEditView.backgroundColor = [UIColor redColor];
        [self addSubview:contactPersonEditView];
        _contactPersonEditView = contactPersonEditView;
    }
    return _contactPersonEditView;
}


- (ContactAddressEditView *)contactAddressEditView{
    if (nil == _contactAddressEditView) {
        ContactAddressEditView *contactAddressEditView = [[ContactAddressEditView alloc] init];
        contactAddressEditView.titleLabel.text = @"联系地址";
        contactAddressEditView.backgroundColor = [UIColor greenColor];
        [self addSubview:contactAddressEditView];
        _contactAddressEditView = contactAddressEditView;
    }
    return _contactAddressEditView;
}
@end
