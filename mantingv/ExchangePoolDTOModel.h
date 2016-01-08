//
//  ExchangePoolDTOModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/8.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface ExchangePoolDTOModel : MTModel
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSDictionary *houseInfoDTO;
@property (nonatomic,copy) NSString *houseWeekName;
@property (nonatomic,copy) NSString *houseWeekPrice;
@property (nonatomic,copy) NSString *userInfoGuid;
@property (nonatomic,copy) NSString *houseWeek;
@property (nonatomic,copy) NSString *username;
@end
