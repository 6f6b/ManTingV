//
//  HolidayHouseSearchContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/28.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HolidayHouseSearchContentScrollView.h"
#import "ProductView.h"
@interface HolidayHouseSearchContentScrollView ()
@property (nonatomic,strong) NSMutableArray *chooserViewData;
@end

@implementation HolidayHouseSearchContentScrollView
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
    [self.parameters setValue:data forKey:@"houseBaseName"];

    [self loadAreaListForChooserView];
    
}


/////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadAreaListForChooserView{
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
        [self loadDataForProductView];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/////////////////////////////////////////////请求产品列表数据///////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadDataForProductView{
    NSString *url = [BASE_URL stringByAppendingString:@"/house/list"];
    NSLog(@"------------>%@",self.parameters);
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //先清空所有产品
        for (int i=0; i<self.subviews.count-1; i++) {
            UIView *view = [self viewWithTag:i+1000];
            [view removeFromSuperview];
            view = nil;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        if (0 == arr.count) {
            return ;
        }
        NSArray *arr2 = [arr[0] objectForKey:@"buildingTypeDTOs"];

        for (int i=0; i<arr2.count; i++) {
            CGFloat X = 0;
            CGFloat Y = CGRectGetMaxY(self.chooserView.frame)+160*i;
            CGFloat W = SCREEN_WIDTH;
            CGFloat H = 150;
            
            ProductView *productView = [[ProductView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
            productView.tag = 1000+i;
            productView.controller = self.controller;
            [productView setValueWith:arr2[i]];
            [self addSubview:productView];
            
            self.contentSize = CGSizeMake(0, CGRectGetMaxY(productView.frame));
        };
        


        
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
//        [self resetParameters];
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
        
        [self loadDataForProductView];
        
    }];
}

@end
