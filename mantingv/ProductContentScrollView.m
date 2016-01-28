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
        productContentView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.000];
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
    [self loadDataForProductContentView];
}

@end
