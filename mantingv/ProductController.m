//
//  ProductController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ProductController.h"
#import "ProductView.h"
#import "LFLoopScrollView.h"
#import "ChooserView.h"

@interface ProductController ()
@property (nonatomic,weak) UIScrollView *productContentScrollView;
@property (nonatomic,weak) LFLoopScrollView *adScrollView;
@end

@implementation ProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建顶部搜索框
    UISearchBar *productSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 10, 80, 40)];
    productSearchBar.placeholder = @"请输入关键词";
    self.navigationItem.titleView = productSearchBar;
    
    //创建滚动广告视图
    LFLoopScrollView *adScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    adScrollView.autoScroll = YES;
    adScrollView.backgroundColor = [UIColor greenColor];
    _adScrollView = adScrollView;
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [_adScrollView setImageWithUrlS:urls];
    [self.productContentScrollView addSubview:_adScrollView];
    
    //创建条件选择器
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, CGRectGetMaxY(adScrollView.frame))];
    [chooserView setTitlesOfButtonWith:buttonTitles];
    [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
    [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
    [self.productContentScrollView addSubview:chooserView];

    
    //创建产品视图
    for (int i=0; i<7; i++) {
        ProductView *productView = [[ProductView alloc] init];
        productView.backgroundColor = [UIColor blueColor];
        CGFloat productViewX = 0;
        CGFloat productViewY = CGRectGetMaxY(adScrollView.frame)+40+i*175;
        CGFloat productViewW = ScreenWidth;
        CGFloat productViewH =  170;
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
