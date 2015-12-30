//
//  ProductContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductContentScrollView.h"
#import "HolidayHouseSearchController.h"
#import "ProductContentView.h"

@interface ProductContentScrollView ()
@property (nonatomic,strong) NSMutableArray *chooserViewData;
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


- (NSMutableArray *)chooserViewData{
    if (nil == _chooserViewData) {
        NSMutableArray *chooserViewData = [[NSMutableArray alloc] init];
        _chooserViewData = chooserViewData;
    }
    return _chooserViewData;
}

- (void)setValueWith:(id)data{

    if (data) {
        [self resetParameters];
        [self.parameters setValue:data forKey:@"houseBaseName"];
        [self loadDataForProductContentView];
        return;
    }
    [self loadPicturesForAdScrollView];
    
}

/////////////////////////////////////////////请求滚动广告数据///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadPicturesForAdScrollView{
     NSString *adScrollViewUrl = [BASE_URL stringByAppendingString:@"/front/banner/first"];
    [self.manager GET:adScrollViewUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        MTModel *model = [MTModel modelWithDictionary:dic];
        [self.loopScrollView setImageWithUrlS:model.data];
        [self loadDataForProductContentView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

///////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)loadAreaListForChooserView{
//    NSString *url = [BASE_URL stringByAppendingString:@"/house/area_enum"];
//    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSArray *arr = [dic objectForKey:@"data"];
//        [self.chooserViewData addObject:arr];
//        [self loadThemeListForChooserView];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"失败");
//    }];
//}
//
///////////////////////////////////////////////请求主题列表数据///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)loadThemeListForChooserView{
//    NSString *url = [BASE_URL stringByAppendingString:@"/house/theme_enum"];
//    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSArray *arr = [dic objectForKey:@"data"];
//        [self.chooserViewData addObject:arr];
//        [self loadPriceListForChooserView];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//}
///////////////////////////////////////////////请求价格列表数据///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void)loadPriceListForChooserView{
//    NSString *url = [BASE_URL stringByAppendingString:@"/house/price_enum"];
//    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSArray *arr = [dic objectForKey:@"data"];
//        [self.chooserViewData addObject:arr];
//        [self.chooserView setDataArraysWith:self.chooserViewData];
//        [self loadDataForProductContentView];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//}

/////////////////////////////////////////////请求产品列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadDataForProductContentView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/list"];
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [self.productContentView removeFromSuperview];
        self.productContentView = nil;
        
        [self.productContentView setValueWith:dic];
        NSArray *arr = [dic objectForKey:@"data"];
        if (0 == arr.count) {
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
//        NSLog(@"%@",self)
        NSDictionary *dic = self.chooserView.dataContentArray[indexOfDataAndButtons][indexPath.row];
        [self resetParameters];
        NSString *value = [dic objectForKey:@"name"];
        if (0 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
                //return ;
            }
            [self.parameters setValue:value forKey:@"houseBaseArea"];
        }
        if (1 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseTheme"]]) {
                //return ;
            }
            [self.parameters setValue:value forKey:@"houseBaseTheme"];
        }
        if (2 == indexOfDataAndButtons) {
            if ([value isEqualToString:[self.parameters objectForKey:@"houseBasePrice"]]) {
                //return ;
            }
            [self.parameters setValue:value forKey:@"houseBasePrice"];
        }
        [self loadDataForProductContentView];
        
    }];
}

@end
