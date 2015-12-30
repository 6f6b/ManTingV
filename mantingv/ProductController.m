//
//  ProductController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductController.h"

@interface ProductController ()<UISearchBarDelegate>
@end

@implementation ProductController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    //创建顶部搜索框
    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
    productSearchBar.placeholder = @"请输入关键词";
    productSearchBar.delegate = self;
    self.navigationItem.titleView = productSearchBar;
    
    [self.productContentScrollView setValueWith:nil];
}

- (ProductContentScrollView *)productContentScrollView{
    if (nil == _productContentScrollView) {
        ProductContentScrollView *productContentScrollView = [[ProductContentScrollView alloc] initWithFrame:self.view.bounds];
        productContentScrollView.backgroundColor = [UIColor whiteColor];
        _productContentScrollView = productContentScrollView;
        productContentScrollView.controller = self;
        [self.view addSubview:productContentScrollView];
    }
    return _productContentScrollView;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    NSString *searchString  = searchBar.text;
    searchBar.text = @"";
    [self.productContentScrollView setValueWith:searchString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
