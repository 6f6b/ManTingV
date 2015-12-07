//
//  ProductController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductController.h"
#import "ProductView.h"

@interface ProductController ()
@property (nonatomic,weak) UIScrollView *productContentScrollView;
@end

@implementation ProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建顶部搜索框
    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
    productSearchBar.placeholder = @"请输入关键词";
    self.navigationItem.titleView = productSearchBar;
    
    //创建滚动广告视图
    UIScrollView *productAdScrollView = [[UIScrollView alloc] init];
    productAdScrollView.frame = CGRectMake(0, 0, ScreenWidth, 100);
    productAdScrollView.backgroundColor = [UIColor greenColor];
    [self.productContentScrollView addSubview:productAdScrollView];
    
    //创建条件选择button
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    for (int i=0; i<buttonTitles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor redColor]];
        button.tag = 100+i;
        [button addTarget:self action:@selector(dealSelect:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        CGFloat btnX = i*ScreenWidth/(float)buttonTitles.count;
        CGFloat btnY = CGRectGetMaxY(productAdScrollView.frame);
        CGFloat btnW = ScreenWidth/(float)buttonTitles.count;
        CGFloat btnH = 40;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [self.productContentScrollView addSubview:button];
    }
    
    //创建产品视图
    for (int i=0; i<7; i++) {
        ProductView *productView = [[ProductView alloc] init];
        productView.backgroundColor = [UIColor blueColor];
        CGFloat productViewX = 0;
        CGFloat productViewY = CGRectGetMaxY(productAdScrollView.frame)+40+i*155;
        CGFloat productViewW = ScreenWidth;
        CGFloat productViewH =  150;
        productView.frame = CGRectMake(productViewX, productViewY, productViewW, productViewH);
        [self.productContentScrollView addSubview:productView];
        [productView setValue:nil forModel:nil];
        
        self.productContentScrollView.contentSize = CGSizeMake(ScreenWidth, CGRectGetMaxY(productView.frame));
    }
    
}

- (void)dealSelect:(UIButton *)button{
    NSInteger *tag = button.tag;
    
}

- (UIScrollView *)productContentScrollView{
    if (nil == _productContentScrollView) {
        UIScrollView *productContentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        NSLog(@"---------->%@",NSStringFromCGRect(self.view.bounds));
        productContentScrollView.backgroundColor = [UIColor yellowColor];
        _productContentScrollView = productContentScrollView;
        [self.view addSubview:productContentScrollView];
    }
    return _productContentScrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
