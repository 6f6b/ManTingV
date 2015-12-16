//
//  UserAccount.m
//  mantingv
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "UserAccount.h"

@implementation UserAccount
+ (instancetype)shareInstance{
    static UserAccount *userAccount;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userAccount = [[UserAccount alloc] init];
    });
    return userAccount;
}
@end
