//
//  ThemeListViewModel.h
//  mantingv
//
//  Created by LiuFeng on 15/12/25.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface ThemeListViewModel : MTModel
@property (nonatomic,copy) NSString *totalNum;
@property (nonatomic,copy) NSString *houseWeekTimeDTOs;
@property (nonatomic,copy) NSString *soldNum;
@property (nonatomic,copy) NSString *houseBaseArea;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *fee;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *houseInfoGuid;
@end
