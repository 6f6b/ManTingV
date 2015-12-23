//
//  HomeAdScrollViewModel.m
//  mantingv
//
//  Created by LiuFeng on 15/12/23.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeAdScrollViewModel.h"

@implementation HomeAdScrollViewModel
+ (instancetype)modelWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    HomeAdScrollViewModel *model = [super modelWithDictionary:keyedValues];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<model.data.count; i++) {
        ///public/img/{guid}/{width}/{height}
        NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/public/img/%@/375/150",model.data[i]]];
        [arr addObject:url];
    }
    model.data = arr;
    return model;
}
@end
