//
//  EditViewWithButton.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "EditViewWithButton.h"
@implementation EditViewWithButton

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.bottom.equalTo(superView);
        make.width.equalTo(@50);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(superView);
        make.bottom.equalTo(superView);
        make.right.equalTo(superView);
    }];
    
}

- (UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIButton *)rightButton{
    if(nil == _rightButton){
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"请选择" forState:UIControlStateNormal];
        [self addSubview:rightButton];
        _rightButton = rightButton;
    }
    return _rightButton;
}

- (void)setValueWith:(id)data{
    NSDictionary *dic = (NSDictionary *)data;
    self.Id = [dic objectForKey:@"id"];
    if (nil != [dic objectForKey:@"provinceName"]) {
        self.area = [dic objectForKey:@"provinceName"];
        [self.rightButton setTitle:self.area forState:UIControlStateNormal];
        return;
    }
    
    if (nil != [dic objectForKey:@"cityName"]) {
        self.area = [dic objectForKey:@"cityName"];
        [self.rightButton setTitle:self.area forState:UIControlStateNormal];
        return;
    }
    
    if (nil != [dic objectForKey:@"districtName"]) {
        self.area = [dic objectForKey:@"districtName"];
        [self.rightButton setTitle:self.area forState:UIControlStateNormal];
        return;
    }
    self.area = @"";
    [self.rightButton setTitle:@"请选择" forState:UIControlStateNormal];
    
}
@end
