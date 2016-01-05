//
//  MyHouseListModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface MyHouseListModel : MTModel
@property (nonatomic,copy) NSString *usable;
@property (nonatomic,copy) NSString *userInfoGuid;
@property (nonatomic,copy) NSString *exchangeHouse;
@property (nonatomic,copy) NSDictionary *houseInfoDTO;
@property (nonatomic,copy) NSDictionary *myHouseStatus;
@property (nonatomic,copy) NSDictionary *houseWeekDTO;
@property (nonatomic,copy) NSString *guid;
@end
