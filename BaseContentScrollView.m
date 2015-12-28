//
//  BaseContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BaseContentScrollView.h"

@implementation BaseContentScrollView

- (NSMutableDictionary *)parameters{
    if (nil == _parameters) {
        NSDictionary *dictionary = @{@"houseBaseName":@"",              //搜索框
                                     @"houseBaseArea":@"NOT_LIMIT",     //目的地
                                     @"houseBaseTheme":@"NOT_LIMIT",    //主题
                                     @"houseBasePrice":@"NOT_LIMIT",    //价格
                                     @"productType":@"HOUSEBASE",
                                     @"pageSize":@"100",
                                     @"currentPage":@"1"
                                     };
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        _parameters = dic;
    }
    return _parameters;
}


- (void)resetParameters{
    [self.parameters setValue:@"" forKey:@"houseBaseName"];
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBaseArea"];
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBaseTheme"];
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBasePrice"];
    [self.parameters setValue:@"HOUSEBASE" forKey:@"productType"];
    [self.parameters setValue:@"100" forKey:@"pageSize"];
    [self.parameters setValue:@"1" forKey:@"currentPage"];
}
@end
