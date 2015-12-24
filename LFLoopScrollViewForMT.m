//
//  LFLoopScrollViewForMT.m
//  mantingv
//
//  Created by LiuFeng on 15/12/24.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "LFLoopScrollViewForMT.h"

@implementation LFLoopScrollViewForMT

- (void)setImageWithUrlS:(NSArray *)urls{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<urls.count; i++) {
        NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/public/img/%@/375/180",urls[i]]];
        [arr addObject:url];
    }
    [super setImageWithUrlS:arr];
}

@end
