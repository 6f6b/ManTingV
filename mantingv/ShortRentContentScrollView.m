//
//  ShortRentContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/29.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentContentScrollView.h"
#import "ShortRentContentView.h"

@interface ShortRentContentScrollView ()
@property (nonatomic,weak) ShortRentContentView *shortRentContentView;
@property (nonatomic,strong) NSMutableDictionary *parameter;
@end
@implementation ShortRentContentScrollView


- (void)setValueWith:(id)data{
    /////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    [self.parameters setValue:data forKey:@"houseBaseName"];
    
    [self loadHolidayHouseListForChooserViewWith:@"NOT_LIMIT"];
    
}

- (ShortRentContentView *)shortRentContentView{
    if (nil == _shortRentContentView) {
        ShortRentContentView *shortRentContentView  = [[ShortRentContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 0)];
        shortRentContentView.backgroundColor = [UIColor colorWithWhite:0.828 alpha:1.000];
        shortRentContentView.controller = self.controller;
        [self addSubview:shortRentContentView];
        _shortRentContentView = shortRentContentView;
    }
    return _shortRentContentView;
}


/////////////////////////////////////////////请求度假基地列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadHolidayHouseListForChooserViewWith:(NSString *)houseBaseArea{
    NSString *urlWithOutHouseBaseArea = [BASE_URL stringByAppendingString:@"/rent/find_house_by_area/"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",urlWithOutHouseBaseArea,houseBaseArea];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        
        //为服务器数据添加一个不限的数据
        NSMutableArray *arr2 = [[NSMutableArray alloc] initWithArray:arr];
        NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] initWithDictionary:arr2[0]];
        [dic2 setValue:@"不限" forKey:@"title"];
        [dic2 setValue:@"" forKey:@"guid"];
        [arr2 insertObject:dic2 atIndex:0];
        
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
        
        NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择度假基地"];
        [self.chooserView setTitlesOfButtonWith:buttonTitles];
        
        NSDictionary *houseBaseArea = [MTTools houseBaseAreaList];
        NSArray *houseBaseAreaTitles = [houseBaseArea objectForKey:@"titles"];
        NSArray *houseBaseAreaValues = [houseBaseArea objectForKey:@"values"];
        
        
        NSDictionary *price = [MTTools priceList];
        NSArray *priceTitles = [price objectForKey:@"titles"];
        NSArray *priceValues = [price objectForKey:@"values"];
        
        NSArray *titles = @[houseBaseAreaTitles,priceTitles,baseAreatitles];
        NSArray *values = @[houseBaseAreaValues,priceValues,baseAreavalues];
        
        [self.chooserView setCellTitlesWith:titles];
        [self setChooserViewDataArray:values];
        

        [self loadDataForShortRentView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


/////////////////////////////////////////////请求短租列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *  默认加载的短租列表
 */
- (void)loadDataForShortRentView{
    NSString *url = [BASE_URL stringByAppendingString:@"/rent/list"];
    [self.manager POST:url parameters:self.parameter progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.shortRentContentView removeFromSuperview];
        self.shortRentContentView = nil;
        NSString *url = [BASE_URL stringByAppendingString:@"/rent/search"];
        [self.manager POST:url parameters:self.parameter progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *arr = [dic objectForKey:@"data"];
            [self.shortRentContentView setValueWith:arr];
            if (0 == arr.count) {
                return ;
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (void)chooserViewDidSelectColumnAtIndex:(NSInteger)index RowAtIndexPath:(NSIndexPath *)indexPath{
            NSString *value = self.chooserViewDataArray[index][indexPath.row];
            [self resetParameters];

            if (0 == index) {
                if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
                    //return ;
                }
                [self loadHolidayHouseListForChooserViewWith:value];
                [self.parameter setValue:value forKey:@"houseBaseArea"];
            }
            if (1 == index) {
                if ([value isEqualToString:[self.parameters objectForKey:@"price"]]) {
                    //return ;
                }
                [self.parameter setValue:value forKey:@"price"];
            }
            if (2 == index) {
                if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseGuid"]]) {
                    //return ;
                }
                [self.parameter setValue:value forKey:@"houseBaseGuid"];
    
            }
            [self loadDataForShortRentView];
}

- (NSMutableDictionary *)parameter{
    if (nil == _parameter) {
        NSDictionary *dic = @{@"houseBaseGuid":@"",
                              @"houseBaseArea":@"NOT_LIMIT",
                              @"price":@"NOT_LIMIT"
                              };
        _parameter = [[NSMutableDictionary alloc] initWithDictionary:dic];
    }
    return _parameter;
}


- (void)resetParameters{
    [self.parameters setObject:@"" forKey:@"houseBaseGuid"];
    [self.parameters setObject:@"NOT_LIMIT" forKey:@"houseBaseArea"];
    [self.parameters setObject:@"NOT_LIMIT" forKey:@"price"];

}
@end
