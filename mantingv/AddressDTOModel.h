//
//  AddressDTOModel.h
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@interface AddressDTOModel : MTModel
@property (nonatomic,copy) NSString *district;
@property (nonatomic,copy) NSString *city;
@property (nonatomic,copy) NSString *area;
@property (nonatomic,copy) NSString *phoneNum;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *guid;
@property (nonatomic,copy) NSString *province;
@end
