//
//  MyHouseListDetailController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyHouseListDetailController.h"
#import "MyHouseListDetailContentScrollView.h"

@interface MyHouseListDetailController ()
@property (nonatomic,weak) MyHouseListDetailContentScrollView *myHouseListDetailContentScrollView;
@end

@implementation MyHouseListDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataFromServer];
    [self.myHouseListDetailContentScrollView setValueWith:nil];
    // Do any additional setup after loading the view.
}

/**
 *  从服务器下载数据
 */
- (void)loadDataFromServer{
    NSString *urlWithOutMyhouseGuid = [BASE_URL stringByAppendingString:@"/my_house/details/"];
    NSString *url = [urlWithOutMyhouseGuid stringByAppendingString:self.myHouseGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.myHouseListDetailContentScrollView setValueWith:[dic objectForKey:@"data"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (MyHouseListDetailContentScrollView *)myHouseListDetailContentScrollView{
    if (nil == _myHouseListDetailContentScrollView) {
        MyHouseListDetailContentScrollView *myHouseListDetailContentScrollView = [[MyHouseListDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        myHouseListDetailContentScrollView.controller = self;
        [self.view addSubview:myHouseListDetailContentScrollView];
        _myHouseListDetailContentScrollView = myHouseListDetailContentScrollView;
    }
    return _myHouseListDetailContentScrollView;
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
