//
//  HolidayHouseSearchController.h
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTTableController.h"
#import "ChooserView.h"

@interface HolidayHouseSearchController : MTTableController
@property (nonatomic,weak) ChooserView *chooserView;
@property (nonatomic,copy) NSMutableDictionary *parameters;
@end
