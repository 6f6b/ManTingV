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
@end
