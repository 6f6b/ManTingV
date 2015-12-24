//
//  MTBaseScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTBaseScrollView : UIScrollView
@property (nonatomic,strong) UIViewController *controller;
@property (nonatomic,strong) AFHTTPSessionManager *manager;
- (void)setValueWith:(id)data;
@end
