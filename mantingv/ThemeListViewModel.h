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

//=================自己添加的属性,服务器在对应的字典中本应给出=======================
@property (nonatomic,copy) NSString *houseType;
@property (nonatomic,copy) NSString *buildingTypeArea;
@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *title;
@end
