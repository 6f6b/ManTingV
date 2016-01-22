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
    [self loadHolidayHouseListForChooserViewWith:@"NOT_LIMIT"];
    
    NSArray *buttonTitles = @[@"目的地",@"周次",@"度假基地"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];
    
    NSDictionary *houseBaseArea = [MTTools houseBaseAreaList];
    NSArray *houseBaseAreaTitles = [houseBaseArea objectForKey:@"titles"];
    NSArray *houseBaseAreaValues = [houseBaseArea objectForKey:@"values"];
    
    
    NSDictionary *houseWeek = [MTTools houseWeekList];
    NSArray *houseWeekTitles = [houseWeek objectForKey:@"titles"];
    NSArray *houseWeekValues = [houseWeek objectForKey:@"values"];
    
    NSArray *titles = @[houseBaseAreaTitles,houseWeekTitles,@[]];
    NSArray *values = @[houseBaseAreaValues,houseWeekValues,@[]];
    
    [self.chooserView setCellTitlesWith:titles];
    [self setChooserViewDataArray:values];
}

- (void)chooserViewDidSelectColumnAtIndex:(NSInteger)index RowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *value = self.chooserViewDataArray[index][indexPath.row];
//    [self resetParameters];
    if (0 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
            //return ;
        }
        [self loadHolidayHouseListForChooserViewWith:value];
        [self.parameters setValue:value forKey:@"houseBaseArea"];
    }
    if (1 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseWeekEnum"]]) {
            //return ;
        }
        [self.parameters setValue:value forKey:@"houseWeekEnum"];
    }
    if (2 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseGuid"]]) {
            //return ;
        }
        [self.parameters setValue:value forKey:@"houseBaseGuid"];
    }
    
    [self.parameters setValue:[MTTools userGuid] forKey:@"userGuid"];
    [self loadDataFromServer];
}

/**
 *  刷新chooserView 的 dataArray
 *
 *
 */
/////////////////////////////////////////////请求度假基地列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadHolidayHouseListForChooserViewWith:(NSString *)houseBaseArea{
    NSString *urlWithOutHouseBaseArea = [BASE_URL stringByAppendingString:@"/exchange/find_house_base/"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",urlWithOutHouseBaseArea,houseBaseArea];
    NSLog(@"%@",url);
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr2 = [dic objectForKey:@"data"];
        
        
        NSMutableArray *baseAreatitles = [[NSMutableArray alloc] init];
        for (int i=0; i<arr2.count; i++) {
            NSDictionary *dic = arr2[i];
            NSString *title = [dic objectForKey:@"title"];
            [baseAreatitles addObject:title];
        }
        
        NSMutableArray *baseAreavalues = [[NSMutableArray alloc] init];
        for (int i=0; i<arr2.count; i++) {
            NSDictionary *dic = arr2[i];
            NSString *value = [dic objectForKey:@"guid"];
            [baseAreavalues addObject:value];
        }
        
        NSMutableArray *titles = [[NSMutableArray alloc] initWithArray:self.chooserView.cellTitles];
        NSMutableArray *values = [[NSMutableArray alloc] initWithArray:self.chooserViewDataArray];
        titles[2] = baseAreatitles;
        values[2] = baseAreavalues;
        

        [self.chooserView setCellTitlesWith:titles];
        [self setChooserViewDataArray:values];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR");
    }];
}


/**
 *  根据自身参数从服务器加载数据
 *
 *
 */
- (void)loadDataFromServer{
    NSString *url = [BASE_URL stringByAppendingString:self.appendingUrl];
    [KVNProgress showWithStatus:@"加载中。。----"];
    NSLog(@"%@",url);
    NSLog(@"%@",self.parameters);

    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self setValueWith:dic];
        [KVNProgress dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}
@end
