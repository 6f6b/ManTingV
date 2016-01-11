//
//  INeedCheckInDetailController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedCheckInDetailController.h"
#import "INeedCheckInDetailContentScrollView.h"

@interface INeedCheckInDetailController ()
@property (nonatomic,weak) INeedCheckInDetailContentScrollView *iNeedCheckInDetailContentScrollView;
@end

@implementation INeedCheckInDetailController

- (id)init{
    if (self = [super init]) {
        self.indexOfhouseWeekGuid = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.iNeedCheckInDetailContentScrollView setValueWith:nil];
    
    [self loadDataFromServer];
    // Do any additional setup after loading the view.
}

/**
 *  从服务器加载我要入驻的房间的详细数据
 *
 *  @return
 */
- (void)loadDataFromServer{
    NSString *urlWithOutHouseGuid = [BASE_URL stringByAppendingString:@"/my_house/details/"];
    NSString *url = [urlWithOutHouseGuid stringByAppendingString:self.myHouseGuid];
    NSLog(@"%@",url);
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        [self.iNeedCheckInDetailContentScrollView setValueWith:data];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


- (INeedCheckInDetailContentScrollView *)iNeedCheckInDetailContentScrollView{
    if (nil == _iNeedCheckInDetailContentScrollView) {
        INeedCheckInDetailContentScrollView *iNeedCheckInDetailContentScrollView = [[INeedCheckInDetailContentScrollView alloc] initWithFrame:self.view.bounds];
        iNeedCheckInDetailContentScrollView.backgroundColor = [UIColor yellowColor];
        iNeedCheckInDetailContentScrollView.controller = self;
        iNeedCheckInDetailContentScrollView = iNeedCheckInDetailContentScrollView;
        [self.view addSubview:iNeedCheckInDetailContentScrollView];
        _iNeedCheckInDetailContentScrollView = iNeedCheckInDetailContentScrollView;
    }
    return _iNeedCheckInDetailContentScrollView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDataFromServer];
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
