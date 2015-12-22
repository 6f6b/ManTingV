//
//  CheckInDetailBaseViewWithRightTextFeild.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailBaseViewWithRightTextFeild.h"

@interface CheckInDetailBaseViewWithRightTextFeild ()
@end
@implementation CheckInDetailBaseViewWithRightTextFeild

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.rightTextFeild mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).with.offset(-10);
        make.centerY.equalTo(superView);
    }];
}

- (UITextField *)rightTextFeild{
    if (nil == _rightTextFeild) {
        UITextField *rightTextFeild = [[UITextField alloc] init];
        rightTextFeild.placeholder = @"";
        rightTextFeild.backgroundColor = [UIColor whiteColor];
        [self addSubview:rightTextFeild];
        _rightTextFeild = rightTextFeild;
    }
    return _rightTextFeild;
}

- (UILabel *)rightLabel{
    return nil;
}
@end
