//
//  ExchangeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ExchangeController.h"
#import "ExchangeContentScrollView.h"
#import "ChooserView.h"
#import "ChoiceTheme.h"

@interface ExchangeController ()
@property (nonatomic,weak) ExchangeContentScrollView *exchangeContentScrollView;
//@property (nonatomic,weak) LFLoopScrollView *adScrollView;
//@property (nonatomic,weak) ChooserView *chooserView;
@end

@implementation ExchangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交换大厅";
    // Do any additional setup after loading the view.
    
    
    //将我的houseGuid放进交换池子
    NSString *urlWithOutHouseGuid = [BASE_URL stringByAppendingString:@"/exchange/add_pool/"];
    NSString *url = [urlWithOutHouseGuid stringByAppendingString:self.myHouseGuid];
    NSLog(@"%@",self.myHouseGuid);
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [KVNProgress showErrorWithStatus:[dic objectForKey:@"result"]];
        NSLog(@"response--->%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [self.exchangeContentScrollView setValueWith:nil];
}


- (ExchangeContentScrollView *)exchangeContentScrollView{
    if (nil == _exchangeContentScrollView) {
        ExchangeContentScrollView *exchangeContentScrollView = [[ExchangeContentScrollView alloc] initWithFrame:self.view.bounds];
        exchangeContentScrollView.backgroundColor = [UIColor yellowColor];
        exchangeContentScrollView.controller = self;

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
