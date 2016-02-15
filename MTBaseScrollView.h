//
//  MTBaseScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPSessionManagerForMT.h"
@interface MTBaseScrollView : UIScrollView
@property (nonatomic,strong) MTModel *model;
@property (nonatomic,weak) UIViewController *controller;
@property (nonatomic,strong) AFHTTPSessionManagerForMT *manager;
@property (nonatomic,strong) void(^refreshBlock)();
- (void)setValueWith:(id)data;
@end
