//
//  MyHouseDTOModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface MyHouseDTOModel : MTModel
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSDictionary *houseInfoDTO;
@property (nonatomic,copy) NSDictionary *houseWeekDTO;
@property (nonatomic,copy) NSString *userInfoGuid;
@property (nonatomic,copy) NSString *myHouseStatus;
@property (nonatomic,copy) NSString *usable;
@property (nonatomic,copy) NSString *exchangeHouse;
@end
