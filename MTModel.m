//
//  MTModel.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTModel.h"

@implementation MTModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
+ (instancetype)modelWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    id model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:keyedValues];
    return model;
}
@end
