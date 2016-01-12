//
//  MTTools.h
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTTools : NSObject

/**
 *
 *
 *  @return 存储在本地的userGuid
 */
+ (NSString *)userGuid;

/**
 *
 *
 *  @return 基地列表
 */
+ (NSArray *)houseBaseAreaList;

/**
 *
 *
 *  @return 价格列表
 */
+ (NSArray *)priceList;

/**
 *
 *
 *  @return 主题列表
 */
+ (NSArray *)themeList;

/**
 *
 *
 *  @return 周次列表
 */
+ (NSArray *)houseWeekList;
@end
