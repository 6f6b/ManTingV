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
    [self.parameters setValue:data forKey:@"houseBaseName"];
    
    [self loadAreaListForChooserView];
    
}

- (ShortRentContentView *)shortRentContentView{
    if (nil == _shortRentContentView) {
        ShortRentContentView *shortRentContentView  = [[ShortRentContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 0)];
        shortRentContentView.controller = self.controller;
        [self addSubview:shortRentContentView];
        _shortRentContentView = shortRentContentView;
    }
    return _shortRentContentView;
}

/////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadAreaListForChooserView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/area_enum"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.chooserViewDataArray addObject:arr];
        [self loadPriceListForChooserView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];
}

/////////////////////////////////////////////请求价格列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadPriceListForChooserView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/price_enum"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.chooserViewDataArray addObject:arr];
        [self loadHolidayHouseListForChooserView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
/////////////////////////////////////////////请求度假屋列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadHolidayHouseListForChooserView{
    NSString *url = [BASE_URL stringByAppendingString:@"/rent/find_house_by_area/NOT_LIMIT"];
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
        
        [self.chooserViewDataArray addObject:arr2];
        [self.chooserView setDataArraysWith:self.chooserViewDataArray];
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

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择度假基地"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];
    [self.chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        NSDictionary *dic = self.chooserViewDataArray[indexOfDataAndButtons][indexPath.row];
        [self resetParameters];
        NSString *value = [dic objectForKey:@"name"];
        if (nil == value) {
            value = [dic objectForKey:@"guid"];
        }
        if (0 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
                //return ;
            }
            [self.parameter setValue:value forKey:@"houseBaseArea"];
        }
        if (1 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"price"]]) {
                //return ;
            }
            [self.parameter setValue:value forKey:@"price"];
        }
        if (2 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseGuid"]]) {
                //return ;
            }
            [self.parameter setValue:value forKey:@"houseBaseGuid"];

        }
        [self loadDataForShortRentView];
    }];
    
    
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

- (void)setParameters:(NSMutableDictionary *)parameters{
    
}

- (void)resetParameters{
    [self.parameters setObject:@"" forKey:@"houseBaseGuid"];
    [self.parameters setObject:@"NOT_LIMIT" forKey:@"houseBaseArea"];
    [self.parameters setObject:@"NOT_LIMIT" forKey:@"price"];

}
@end
