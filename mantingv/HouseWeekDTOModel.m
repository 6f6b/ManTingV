//
//  HouseWeekDTOModel.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "HouseWeekDTOModel.h"

@implementation HouseWeekDTOModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"desc"];
    }
}
@end
