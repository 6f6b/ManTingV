//
//  TransferDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferDetailContentScrollView.h"
#import "SelectView.h"
#import "TransferDetailTopContentView.h"
@interface TransferDetailContentScrollView ()<SeclectViewDelegate>
@property (nonatomic,weak) TransferDetailTopContentView *transferDetailTopContentView;
@property (nonatomic,weak) SelectView *selectView;
@end

@implementation TransferDetailContentScrollView

- (SelectView *)selectView{
    if (nil == _selectView) {
        SelectView *selectView = [[SelectView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.transferDetailTopContentView.frame), ScreenWidth, 0)];
        selectView.backgroundColor = [UIColor greenColor];
        [self addSubview:selectView];
        _selectView = selectView;
    }
    return _selectView;
}

- (TransferDetailTopContentView *)transferDetailTopContentView{
    if (nil == _transferDetailTopContentView) {
        TransferDetailTopContentView *transferDetailTopContentView = [[TransferDetailTopContentView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
        [self addSubview:transferDetailTopContentView];
        _transferDetailTopContentView = transferDetailTopContentView;
    }
    return _transferDetailTopContentView;
}

- (void)selectView:(UIView *)selectView{
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(selectView.frame));
}

- (void)setValueWith:(id)data{
    [self.transferDetailTopContentView setValueWith:nil];
    
    [self.selectView setValue];
    self.selectView.delegate = self;
}
@end
