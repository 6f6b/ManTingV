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
@end

@implementation HolidayHouseSearchContentScrollView


- (void)setValueWith:(id)data{
    /////////////////////////////////////////////请求目的地列表数据///////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    [self.parameters setValue:data forKey:@"houseBaseName"];
    [self loadDataForProductView];
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
    
    [self.parameters setValue:@"" forKey:@"houseBaseName"];//搜索框
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBaseArea"];//目的地
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBaseTheme"];//主题
    [self.parameters setValue:@"NOT_LIMIT" forKey:@"houseBasePrice"];//价格
    [self.parameters setValue:@"HOUSEBASE" forKey:@"productType"];
    [self.parameters setValue:@"100" forKey:@"pageSize"];
    [self.parameters setValue:@"1" forKey:@"currentPage"];
    
    NSArray *buttonTitles = @[@"选择目的地",@"选择主题",@"选择价格"];
    [self.chooserView setTitlesOfButtonWith:buttonTitles];

    NSDictionary *houseBaseArea = [MTTools houseBaseAreaList];
    NSArray *houseBaseAreaTitles = [houseBaseArea objectForKey:@"titles"];
    NSArray *houseBaseAreaValues = [houseBaseArea objectForKey:@"values"];
    
    NSDictionary *theme = [MTTools themeList];
    NSArray *themeTitles = [theme objectForKey:@"titles"];
    NSArray *themeValues = [theme objectForKey:@"values"];
    
    NSDictionary *price = [MTTools priceList];
    NSArray *priceTitles = [price objectForKey:@"titles"];
    NSArray *priceValues = [price objectForKey:@"values"];
    
    NSArray *titles = @[houseBaseAreaTitles,themeTitles,priceTitles];
    NSArray *values = @[houseBaseAreaValues,themeValues,priceValues];
    
    [self.chooserView setCellTitlesWith:titles];
    [self setChooserViewDataArray:values];
}

- (void)chooserViewDidSelectColumnAtIndex:(NSInteger)index RowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *value = self.chooserViewDataArray[index][indexPath.row];
    NSLog(@"-------->%@",value);
    if (0 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseArea"]]) {
            //return ;
        }
        [self.parameters setValue:value forKey:@"houseBaseArea"];
    }
    if (1 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseBaseTheme"]]) {
            //return ;
        }
        [self.parameters setValue:value forKey:@"houseBaseTheme"];
    }
    if (2 == index) {
        if ([value isEqualToString:[self.parameters objectForKey:@"houseBasePrice"]]) {
            //return ;
        }
        [self.parameters setValue:value forKey:@"houseBasePrice"];
    }
    
    [self loadDataForProductView];
    

}

@end
