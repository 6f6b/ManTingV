//
//  HomeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeController.h"
#import "HomeContentScrollView.h"

@interface HomeController ()
@property (weak,nonatomic) HomeContentScrollView* homeContentScrollView;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeContentScrollView *homeContentScrollView = [[HomeContentScrollView alloc] initWithFrame:self.view.bounds];
    homeContentScrollView.backgroundColor = [UIColor whiteColor];
    homeContentScrollView.contentSize = CGSizeMake(0, 1000);
    homeContentScrollView.controller = self;
    _homeContentScrollView = homeContentScrollView;
    [self.view addSubview:homeContentScrollView];
    
    [homeContentScrollView setValueWith:nil];
    //控制器下载数据
    [self downLoadData];
    
    //创建顶部搜索框
    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
    productSearchBar.placeholder = @"请输入关键词";
    self.navigationItem.titleView = productSearchBar;
    
    //创建左边下弹城市列表按钮
    UIButton *homeCityListButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeCityListButton.frame = CGRectMake(0, 0, 50, 30);
    [homeCityListButton setTitle:@"成都" forState:UIControlStateNormal];
    [homeCityListButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [homeCityListButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [homeCityListButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [homeCityListButton setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, -40)];
    [homeCityListButton addTarget:self action:@selector(dealCityList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeCityListButton];
    
}

//- (HomeContentScrollView *)homeContentScrollView{
//    if (nil == _homeContentScrollView) {
//        HomeContentScrollView *homeContentScrollView = [[HomeContentScrollView alloc] initWithFrame:self.view.bounds];
//        homeContentScrollView.backgroundColor = [UIColor whiteColor];
//        homeContentScrollView.controller = self;
//        _homeContentScrollView = homeContentScrollView;
//        [self.view addSubview:homeContentScrollView];
//    }
//    return _homeContentScrollView;
//}

- (void)downLoadData{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
///////////////////////////////////////////////下载轮播图片数据///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    NSString *adScrollViewUrl = [BASE_URL stringByAppendingString:@"/front/banner/first"];
//    [manager GET:adScrollViewUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        HomeAdScrollViewModel *model = [HomeAdScrollViewModel modelWithDictionary:dic];
//        [self.homeContentScrollView.adScrollView setImageWithUrlS:model.data];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//    
///////////////////////////////////////////////特价房数据///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    NSString *url = [BASE_URL stringByAppendingString:@"/house/special"];
//    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        ThemeContentViewModel *model = [ThemeContentViewModel modelWithDictionary:dic];
//        [self.homeContentScrollView.themeContentView setValueWith:model];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
//    
///////////////////////////////////////////////第二广告位数据///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////    NSString *whatUrl = [BASE_URL stringByAppendingString:@"/front/banner/second"];
////    [manager GET:whatUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
////        
////    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
////        HomeWhatModel *model = [HomeWhatModel modelWithDictionary:dic];
////        [self.homeContentScrollView.what lfSetImageWithURL:model.data];
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        
////    }];
    //下载数据
    //处理数据
    //刷新UI
}


- (void)dealCityList{
    NSLog(@"城市列表");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
