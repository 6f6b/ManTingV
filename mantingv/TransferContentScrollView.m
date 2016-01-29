//
//  TransferContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferContentScrollView.h"
#import "TransferContainView.h"

@interface TransferContentScrollView ()
@property (nonatomic,weak) TransferContainView *transferContainView;
@end
@implementation TransferContentScrollView


- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.appendingUrl = @"/assignment/list";
    }
    return self;
}

- (TransferContainView *)transferContainView{
    if(nil == _transferContainView){
        TransferContainView *transferContainView = [[TransferContainView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 10)];
        transferContainView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self addSubview:transferContainView];
        transferContainView.controller = self.controller;
        _transferContainView = transferContainView;
    }
    return _transferContainView;
}

- (void)setValueWith:(id)data{
    if (nil == data) {
        [self loadDataFromServer];
    }
    [self.transferContainView removeFromSuperview];
    self.transferContainView = nil;
    NSArray *arr = [data objectForKey:@"data"];
    [self.transferContainView setValueWith:arr];
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.transferContainView.frame));
}

@end
