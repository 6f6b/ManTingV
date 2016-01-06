//
//  ContactAddressEditView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ContactAddressEditView.h"

@implementation ContactAddressEditView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    [self.proviceEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.height.equalTo(@50);
    }];
    
    [self.cityEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.proviceEditView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.height.equalTo(@50);
    }];
    
    [self.countyEditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityEditView.mas_bottom);
        make.left.equalTo(superView);
        make.right.equalTo(superView);
        make.height.equalTo(@50);
    }];
}

- (EditViewWithButton *)proviceEditView{
    if (nil == _proviceEditView) {
        EditViewWithButton *proviceEditView = [[EditViewWithButton alloc] init];
        proviceEditView.titleLabel.text = @"省份";
        
        [self addSubview:proviceEditView];
        _proviceEditView = proviceEditView;
    }
    return _proviceEditView;
}

- (EditViewWithButton *)cityEditView{
    if (nil == _cityEditView) {
        EditViewWithButton *cityEditView = [[EditViewWithButton alloc] init];
        cityEditView.titleLabel.text = @"城市";
        [self addSubview:cityEditView];
        _cityEditView = cityEditView;
    }
    return _cityEditView;
}

- (EditViewWithButton *)countyEditView{
    if (nil == _countyEditView) {
        EditViewWithButton *countyEditView = [[EditViewWithButton alloc] init];
        countyEditView.titleLabel.text = @"区/县";
        [self addSubview:countyEditView];
        _countyEditView = countyEditView;
    }
    return _countyEditView;
}


@end
