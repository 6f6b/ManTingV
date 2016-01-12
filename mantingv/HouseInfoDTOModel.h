//
//  HouseInfoDTOModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface HouseInfoDTOModel : MTModel
@property (nonatomic,copy) NSString *buildingTypeArea;
@property (nonatomic,copy) NSString *buildingTypeGuid;
@property (nonatomic,copy) NSArray *houseExtraFeeDTOs;
@property (nonatomic,copy) NSString *permits;
@property (nonatomic,copy) NSArray *imageGuids;
@property (nonatomic,copy) NSString *province;
@property (nonatomic,copy) NSString *developers;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSArray *houseWeekDTOs;
@property (nonatomic,copy) NSString *houseType;
@property (nonatomic,copy) NSString *houseFeature;
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSArray *supportingDTOs;
@property (nonatomic,copy) NSArray *equipmentDTOs;
@property (nonatomic,copy) NSString *name;
@end
