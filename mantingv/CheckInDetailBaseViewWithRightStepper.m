//
//  CheckInDetailBaseViewWithRightStepper.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "CheckInDetailBaseViewWithRightStepper.h"
@interface CheckInDetailBaseViewWithRightStepper ()
@end
@implementation CheckInDetailBaseViewWithRightStepper

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.lfStepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(superView).with.offset(-10);
        make.centerY.equalTo(superView);
    }];
}

- (LFStepper *)lfStepper{
    if (nil == _lfStepper) {
        LFStepper *lfStepper = [LFStepper lfStepperWithFrame:CGRectMake(0, 0, 80, 40)];
        lfStepper.backgroundColor = [UIColor whiteColor];
        [self addSubview:lfStepper];
        _lfStepper = lfStepper;
    }
    return _lfStepper;
}

- (UILabel *)rightLabel{
    return nil;
}
@end
