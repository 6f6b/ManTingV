//
//  ShortRentDetailContentScrollViewModel.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentDetailContentScrollViewModel.h"

@implementation ShortRentDetailContentScrollViewModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}
@end
