//
//  ProductContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/24.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContentScrollView.h"
#import "HolidayHouseSearchController.h"
#import "ProductContentView.h"

@interface ProductContentScrollView ()
@property (nonatomic,strong) NSMutableArray *chooserViewData;
@property (nonatomic,copy) NSMutableDictionary *parameters;
@property (nonatomic,weak) ProductContentView *productContentView;
@end
@implementation ProductContentScrollView

- (ProductContentView *)productContentView{
    if (nil == _productContentView) {
        ProductContentView *productContentView = [[ProductContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.chooserView.frame), SCREEN_WIDTH, 0)];
        [self addSubview:productContentView];
        productContentView.controller = self.controller;
        _productContentView = productContentView;
    }
    return _productContentView;
}

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
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        _parameters = dic;
    }
    return _parameters;
}

- (NSMutableArray *)chooserViewData{
    if (nil == _chooserViewData) {
        NSMutableArray *chooserViewData = [[NSMutableArray alloc] init];
        _chooserViewData = chooserViewData;
    }
    return _chooserViewData;
}

- (void)setValueWith:(id)data{
/////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    NSString *url = [BASE_URL stringByAppendingString:@"/house/area_enum"];
    
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.chooserViewData addObject:arr];
        [self loadThemeListForChooserView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败");
    }];
}

/////////////////////////////////////////////请求主题列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadThemeListForChooserView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/theme_enum"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        [self.chooserViewData addObject:arr];
        [self loadPriceListForChooserView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
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
        [self.chooserViewData addObject:arr];
        [self.chooserView setDataArraysWith:self.chooserViewData];
        [self loadDataForProductContentView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////请求产品列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadDataForProductContentView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/list"];

    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [self.productContentView setValueWith:dic];
        NSArray *arr = [dic objectForKey:@"data"];
        if (0 == arr.count) {
            [KVNProgress showErrorWithStatus:@"查找失败"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.chooserViewData = [[NSMutableArray alloc] init];
    
    NSArray *buttonTitles = @[@"选择目的地",@"选择主题",@"选择价格"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];
    [self.chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        NSDictionary *dic = self.chooserViewData[indexOfDataAndButtons][indexPath.row];
        NSString *value = [dic objectForKey:@"name"];
        if (0 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
                return ;
            }
            [self.parameters setValue:value forKey:@"houseBaseArea"];
        }
        if (1 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseTheme"]]) {
                return ;
            }
            [self.parameters setValue:value forKey:@"houseBaseTheme"];
        }
        if (2 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBasePrice"]]) {
                return ;
            }
            [self.parameters setValue:value forKey:@"houseBasePrice"];
        }
        [self.productContentView removeFromSuperview];
        self.productContentView = nil;
        [self loadDataForProductContentView];
        
//        NSLog(@"%@",self.chooserViewData);
//        NSDictionary *dic = self.chooserViewData[indexOfDataAndButtons][indexPath.row];
//        NSLog(@"%@",[dic objectForKey:@"label"]);
//        NSLog(@"%@",indexPath);
    }];
}
@end
