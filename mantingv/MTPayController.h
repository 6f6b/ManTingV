//
//  MTPayController.h
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTController.h"
#import "ThemeListViewModel.h"


@interface MTPayController : MTController
@property (nonatomic,assign) NSInteger addressTag;
@property (nonatomic,strong) ThemeListViewModel *themeListViewModel;

@property (nonatomic,assign) double totalPrice;
@end
