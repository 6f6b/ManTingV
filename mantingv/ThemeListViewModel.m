//
//  ThemeListViewModel.m
//  mantingv
//
//  Created by LiuFeng on 15/12/25.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListViewModel.h"

@implementation ThemeListViewModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([@"description"  isEqual: key]) {
        self.desc = value;
    }
}
@end
