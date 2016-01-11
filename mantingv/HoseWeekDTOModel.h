//
//  HoseWeekDTOModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface HoseWeekDTOModel : MTModel
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *houseInfoGuid;
@property (nonatomic,copy) NSString *soldNum;
@property (nonatomic,copy) NSString *houseBaseArea;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSArray *houseWeekTimeDTOs;
@property (nonatomic,copy) NSString *fee;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSString *totalNum;
@end
