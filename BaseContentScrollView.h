//
//  BaseContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"

@interface BaseContentScrollView : MTBaseScrollView
@property (nonatomic,strong) NSMutableDictionary *parameters;
- (void)resetParameters;
@end
