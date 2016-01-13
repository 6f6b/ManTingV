//
//  ContentScrollViewForExchangeOrTransfer.m
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewForExchangeOrTransfer.h"

@implementation ContentScrollViewForExchangeOrTransfer

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBaseArea"];
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseWeekEnum"];
    [self.parameters setValue:@"" forKey:@"houseBaseGuid"];
    [self.parameters setValue:[MTTools userGuid] forKey:@"userGuid"];
    
    NSString *url = [BASE_URL stringByAppendingString:@"/exchange/find_house_base/NOT_LIMIT"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self refreshDataOfChooserViewWith:dic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [self.chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        NSDictionary *dic = self.chooserView.dataContentArray[indexOfDataAndButtons][indexPath.row];
        [self resetParameters];
        NSString *value = [dic objectForKey:@"name"];
        if (0 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
                //return ;
            }
            NSString *urlWithOutHouseBaseArea = [BASE_URL stringByAppendingString:@"/exchange/find_house_base/"];
            NSString *url = [urlWithOutHouseBaseArea stringByAppendingString:value];
            [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                [self refreshDataOfChooserViewWith:dic];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
            [self.parameters setValue:@"" forKey:@"houseBaseGuid"];
            [self.parameters setValue:value forKey:@"houseBaseArea"];
        }
        if (1 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseWeekEnum"]]) {
                //return ;
            }
            [self.parameters setValue:value forKey:@"houseWeekEnum"];
        }
        if (2 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseGuid"]]) {
                //return ;
            }
            [self.parameters setValue:value forKey:@"houseBaseGuid"];
        }
        
        [self.parameters setValue:[MTTools userGuid] forKey:@"userGuid"];
        [self loadDataFromServer];
        
    }];
}

/**
 *  刷新chooserView 的 dataArray
 *
 *
 */
- (void)refreshDataOfChooserViewWith:(NSDictionary *)data{
    NSArray *arr = [data objectForKey:@"data"];
    NSMutableArray *houseBaseGuids = [[NSMutableArray alloc] init];
    for (int i=0; i<arr.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        NSString *guid = [arr[i] objectForKey:@"guid"];
        NSString *title = [arr[i] objectForKey:@"title"];
        [dic setValue:guid forKey:@"name"];
        [dic setValue:title forKey:@"label"];
        [houseBaseGuids addObject:dic];
    }
    NSMutableArray *chooserViewData = [[NSMutableArray alloc] initWithArray:self.chooserView.dataContentArray];
    chooserViewData[2] = houseBaseGuids;
    self.chooserView.dataContentArray = chooserViewData;
}

/**
 *  根据自身参数从服务器加载数据
 *
 *
 */
- (void)loadDataFromServer{
    NSString *url = [BASE_URL stringByAppendingString:self.appendingUrl];
    [KVNProgress showWithStatus:@"加载中。。"];
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self setValueWith:dic];
        [KVNProgress dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
