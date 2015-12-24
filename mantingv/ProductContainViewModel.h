//
//  ProductContainViewModel.h
//  mantingv
//
//  Created by LiuFeng on 15/12/24.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface ProductContainViewModel : MTModel
@property (nonatomic,copy) NSString *introduction;
@property (nonatomic,copy) NSNumber *houseTypeNum;
@property (nonatomic,copy) NSString *information;
@property (nonatomic,copy) NSString *productType;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *houseBaseArea;
@property (nonatomic,copy) NSString *houseBaseTheme;
@property (nonatomic,copy) NSArray *buildingTypeDTOs;
@property (nonatomic,copy) NSArray *imageGuids;
@property (nonatomic,copy) NSString *guid;
@end
