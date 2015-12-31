//
//  UserAccount.h
//  mantingv
//
//  Created by LiuFeng on 15/12/31.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTModel.h"
typedef enum {
    MAN,
    WOMAN
}SEX;

@interface UserAccount : MTModel
@property (nonatomic,copy) NSString *realName;
@property (nonatomic,copy) NSString *position;
@property (nonatomic,copy) NSString *userGuid;
@property (nonatomic,copy) NSString *province;
@property (nonatomic,copy) NSString *area;
@property (nonatomic,copy) NSString *cities;
@property (nonatomic,copy) NSString *imageGuid;
@property (nonatomic,copy) NSString *idcard;
@property (nonatomic,copy) NSString *districts;
@property (nonatomic,copy) NSString *birthday;
@property (nonatomic,copy) NSString *phoneNum;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *district;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *provinces;

@property (nonatomic,strong) NSMutableDictionary *parameter;
@end
