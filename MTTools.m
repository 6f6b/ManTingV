//
//  MTTools.m
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTTools.h"

@implementation MTTools

+ (NSString *)userGuid{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    return userGuid;
}

/**
 *
 *
 *  @return 目的地列表
 */
+ (NSArray *)houseBaseAreaList{
    //目的
    NSDictionary *dicDestination1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicDestination2 = @{@"name":@"SANYA",@"label":@"三亚"};
    NSDictionary *dicDestination3 = @{@"name":@"LIJIANG",@"label":@"丽江"};
    NSDictionary *dicDestination4 = @{@"name":@"XISHUANGBANNA",@"label":@"西双版纳"};
    NSDictionary *dicDestination5 = @{@"name":@"SHENZHEN",@"label":@"深圳"};
    NSDictionary *dicDestination6 = @{@"name":@"GUANGZHOU",@"label":@"广州"};
    NSDictionary *dicDestination7 = @{@"name":@"CHENGDU",@"label":@"成都"};
    NSDictionary *dicDestination8 = @{@"name":@"SUZHOU",@"label":@"苏州"};
    NSDictionary *dicDestination9 = @{@"name":@"KUNMING",@"label":@"昆明"};
    NSArray *arr = @[dicDestination1,dicDestination2,dicDestination3,dicDestination4,dicDestination5,dicDestination6,dicDestination7,dicDestination8,dicDestination9];
    return arr;
}

/**
 *
 *
 *  @return 价格列表
 */
+ (NSArray *)priceList{
    //价格
    NSDictionary *dicPrice1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicPrice2 = @{@"name":@"ZERO_TO_FIVE",@"label":@"5万以下"};
    NSDictionary *dicPrice3 = @{@"name":@"FIVE_TO_TEN",@"label":@"5-10万"};
    NSDictionary *dicPrice4 = @{@"name":@"TEN_TO_FIFTEEN",@"label":@"10-15万"};
    NSDictionary *dicPrice5 = @{@"name":@"FIFTEEN_TO_TWENTY",@"label":@"15-20万"};
    NSArray *arr = @[dicPrice1,dicPrice2,dicPrice3,dicPrice4,dicPrice5];
    return arr;
}

/**
 *
 *
 *  @return 主题列表
 */
+ (NSArray *)themeList{
    //主题
    NSDictionary *dicTheme1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicTheme2 = @{@"name":@"GAOERFU",@"label":@"高尔夫"};
    NSDictionary *dicTheme3 = @{@"name":@"SHATAN",@"label":@"沙滩"};
    NSDictionary *dicTheme4 = @{@"name":@"HUJING",@"label":@"湖景"};
    NSDictionary *dicTheme5 = @{@"name":@"XUESHAN",@"label":@"雪山"};
    NSDictionary *dicTheme6 = @{@"name":@"GUZHEN",@"label":@"古镇"};
    NSDictionary *dicTheme7 = @{@"name":@"BIHAN",@"label":@"避寒"};
    NSDictionary *dicTheme8 = @{@"name":@"BISHU",@"label":@"避暑"};
    NSDictionary *dicTheme9 = @{@"name":@"WENQUAN",@"label":@"温泉"};
    NSArray *arr = @[dicTheme1,dicTheme2,dicTheme3,dicTheme4,dicTheme5,dicTheme6,dicTheme7,dicTheme8,dicTheme9];
    return arr;
}

/**
 *
 *
 *  @return 周次列表
 */
+ (NSArray *)houseWeekList{
    //周次
    NSDictionary *dicWeek1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicWeek2 = @{@"name":@"GOLD",@"label":@"黄金周"};
    NSDictionary *dicWeek3 = @{@"name":@"BUSY",@"label":@"旺季周"};
    NSDictionary *dicWeek4 = @{@"name":@"COMMON",@"label":@"平季周"};
    NSDictionary *dicWeek5 = @{@"name":@"SLACK",@"label":@"淡季周"};
    NSArray *arr = @[dicWeek1,dicWeek2,dicWeek3,dicWeek4,dicWeek5];
    return arr;
}


/**
 *  将服务器返回的状态集转换为用户可见字符串
 *
 *  @param result 服务器返回的状态集
 *
 *  @return 用户可见字符串
 */
+ (NSString *)resultStringWithEnumString:(NSString *)result{
    NSDictionary *resultEnum = @{@"SUCCESS":@"成功",
                                 @"ERROR":@"服务器出错",
                                 @"VALIDA_NUM_ERROR":@"验证码错误",
                                 @"PASSWORD_ERROR":@"密码错误",
                                 @"USERNAME_ERROR":@"用户名错误",
                                 @"PASSWORD_NOT_SAME":@"密码不一致",
                                 @"USER_IS_NOT_EXIST":@"用户不存在",
                                 @"USER_IS_EXIST":@"用户已存在",
                                 @"EXCHANGE_POWER_INADEQUATE":@"交换权限不足",
                                 @"OLD_PASSWORD_ERROR":@"旧密码错误",
                                 @"EXCHANGE_IS_EXIST":@"已加入交换池",
                                 @"EXCHANGE_NOT_ALLOW":@"交换不被允许",};
    NSString *resultForUser = [resultEnum objectForKey:result];
    if (nil == resultForUser) {
        resultForUser = @"发生未知错误!";
    }
    return resultForUser;
}
@end
