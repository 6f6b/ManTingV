//
//  MTModel.h
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTModel : NSObject
@property (nonatomic,copy) NSString *result;
@property (nonatomic,copy) id data;
+ (instancetype)modelWithDictionary:(NSDictionary<NSString *,id> *)keyedValues;
@end
