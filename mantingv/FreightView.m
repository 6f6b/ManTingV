//
//  FreightView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "FreightView.h"

@interface FreightView ()
@property (nonatomic,weak) UILabel *freightLabel;
@property (nonatomic,weak) UILabel *freightShowLabel;
@end
@implementation FreightView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIView *superView = self;
    
    [self.freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 左侧 5
        make.left.equalTo(superView).with.offset(5);
    }];
    
    
    [self.freightShowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //位于 父视图 竖直中心
        make.centerY.equalTo(superView);
        
        //距 父视图 右侧 5
        make.right.equalTo(superView).with.offset(-5);
    }];
}

- (UILabel *)freightLabel{
    if (nil == _freightLabel) {
        UILabel *freightLabel = [[UILabel alloc] init];
        freightLabel.text = @"运费";
        [self addSubview:freightLabel];
        _freightLabel = freightLabel;
    }
    return _freightLabel;
}

- (UILabel *)freightShowLabel{
    if (nil == _freightShowLabel) {
        UILabel *freightShowLabel = [[UILabel alloc] init];
        freightShowLabel.text = @"0";
        [self addSubview:freightShowLabel];
        _freightShowLabel = freightShowLabel;
    }
    return _freightShowLabel;
}

@end
