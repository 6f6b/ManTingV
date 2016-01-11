//
//  HoseWeekDTOModel.m
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "HoseWeekDTOModel.h"

@implementation HoseWeekDTOModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}
@end
