//
//  ProductViewFatherModel.h
//  mantingv
//
//  Created by LiuFeng on 15/12/25.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface ProductViewFatherModel : MTModel
@property (nonatomic,copy) NSString *houseBaseGuid;
@property (nonatomic,copy) NSString *area;
@property (nonatomic,copy) NSString *personNum;
@property (nonatomic,copy) NSString *buildingArea;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *extraArea;
@property (nonatomic,copy) NSString *houseType;
@property (nonatomic,copy) NSArray *houseInfoDTOs;
@property (nonatomic,copy) NSArray *imageGuids;
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSString *name;

@end
