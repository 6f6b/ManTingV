//
//  HouseDetailContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "HouseDetailContentScrollView.h"
#import "HouseInfoDTOModel.h"

@implementation HouseDetailContentScrollView

- (void)setValueWith:(id)data{
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:data];
    self.controller.title = houseInfoDTOModel.name;
    [self.loopScrollView setImageWithUrlS:houseInfoDTOModel.imageGuids];
    
}

@end
