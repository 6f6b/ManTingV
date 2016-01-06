//
//  ContactPersonEditView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ContactPersonEditView.h"

@implementation ContactPersonEditView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    [self.nameEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.height.equalTo(@50);
    }];
    
    [self.phoneNumEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameEditView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.height.equalTo(@50);
    }];
}

- (EditViewWithTextFiled *)nameEditView{
    if (nil == _nameEditView) {
        EditViewWithTextFiled *nameEditView = [[EditViewWithTextFiled alloc] init];
        nameEditView.titleLabel.text = @"姓名";
        nameEditView.rightTextFiled.placeholder = @"请输入姓名";
        [self addSubview:nameEditView];
        _nameEditView = nameEditView;
    }
    return _nameEditView;
}

- (EditViewWithTextFiled *)phoneNumEditView{
    if (nil == _phoneNumEditView) {
        EditViewWithTextFiled *phoneNumEditView = [[EditViewWithTextFiled alloc] init];
        phoneNumEditView.titleLabel.text = @"电话:";
        phoneNumEditView.rightTextFiled.placeholder = @"请输入联系电话";
        [self addSubview:phoneNumEditView];
        _phoneNumEditView = phoneNumEditView;
    }
    return _phoneNumEditView;
}
@end
