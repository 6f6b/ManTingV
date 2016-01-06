//
//  EditViewWithTextFiled.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "EditViewWithTextFiled.h"

@implementation EditViewWithTextFiled

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(superView);
        make.bottom.equalTo(superView);
        make.width.equalTo(@50);
    }];
    
    [self.rightTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (UITextField *)rightTextFiled{
    if(nil == _rightTextFiled){
        UITextField *rightTextFiled = [[UITextField alloc] init];
        rightTextFiled.textAlignment = NSTextAlignmentLeft;
        [self addSubview:rightTextFiled];
        _rightTextFiled = rightTextFiled;
    }
    return _rightTextFiled;
}

@end
