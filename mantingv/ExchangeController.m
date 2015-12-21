//
//  ExchangeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeController.h"
#import "ChooserView.h"
#import "ChoiceTheme.h"

#import "ExchangeListController.h"

@interface ExchangeController ()
@property (nonatomic,weak) MTBaseScrollView *exchangeContentScrollView;
@property (nonatomic,weak) LFLoopScrollView *adScrollView;
@property (nonatomic,weak) ChooserView *chooserView;
@end

@implementation ExchangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    [self.exchangeContentScrollView addSubview:_adScrollView];
    
    //创建条件选择器
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, CGRectGetMaxY(adScrollView.frame))];
    [chooserView setTitlesOfButtonWith:buttonTitles];
    [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
    [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
    _chooserView = chooserView;
    [self.exchangeContentScrollView addSubview:chooserView];
    
    for (int i=0; i<10; i++) {
        CGFloat X = 0;
        CGFloat Y = CGRectGetMaxY(self.chooserView.frame)+100*i+10;
        CGFloat W = ScreenWidth;
        CGFloat H = 90;
        
        ChoiceTheme *choiceTheme = [[ChoiceTheme alloc] initWithFrame:CGRectMake(X, Y, W, H)];
        choiceTheme.tag = 100+i;
        self.exchangeContentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(choiceTheme.frame));
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [choiceTheme addGestureRecognizer:tap];
        
        [self.exchangeContentScrollView addSubview:choiceTheme];
    }

}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    NSLog(@"%lu",tap.view.tag);
    ExchangeListController *exchangeListController = [[ExchangeListController alloc] init];
    exchangeListController.title =  [NSString stringWithFormat:@"%lu",tap.view.tag];
    [self.navigationController pushViewController:exchangeListController animated:YES];
}

- (MTBaseScrollView *)exchangeContentScrollView{
    if (nil == _exchangeContentScrollView) {
        MTBaseScrollView *exchangeContentScrollView = [[MTBaseScrollView alloc] initWithFrame:self.view.bounds];
        exchangeContentScrollView.backgroundColor = [UIColor yellowColor];
        _exchangeContentScrollView = exchangeContentScrollView;
        [self.view addSubview:exchangeContentScrollView];
    }
    return _exchangeContentScrollView;
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
