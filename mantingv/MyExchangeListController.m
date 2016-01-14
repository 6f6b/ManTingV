//
//  MyExchangeListController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/8.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyExchangeListController.h"
#import "MTSwitchView.h"
#import "MyExchangeListCell.h"
#import "ExchangePoolDTOModel.h"
#import "HouseInfoDTOModel.h"

@interface MyExchangeListController ()
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,copy) NSString *appendingUrl;
@end
@implementation MyExchangeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的交换";
    NSArray *urls = @[@"/my_house/exchange_list/",@"/my_house/exchanging_list/"];
    self.appendingUrl = urls[0];
    
    NSArray *titles = @[@"正常",@"失效"];
    MTSwitchView *switchView = [MTSwitchView switchViewWithTitles:titles];
    [switchView setClickedAction:^(NSInteger index) {
        self.appendingUrl = urls[index-1000];
        [self loadDataFromServer];
    }];
    _switchView = switchView;
    [self.view addSubview:switchView];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyExchangeListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyExchangeListCell class])];
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.switchView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.switchView.frame));
    
    [self loadDataFromServer];
    // Do any additional setup after loading the view.
}

- (void)loadDataFromServer{
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:self.appendingUrl];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:[MTTools userGuid]];
    NSLog(@"----->%@",url);
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 代理方法实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (0 == self.dataArray.count) {
        [KVNProgress showErrorWithStatus:@"数据为空！"];
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyExchangeListCell *myExchangeListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyExchangeListCell class])];
    ExchangePoolDTOModel *exchangePoolDTOModel = [ExchangePoolDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:exchangePoolDTOModel.houseInfoDTO];
    [myExchangeListCell.headImage lfSetImageWithURL:houseInfoDTOModel.imageGuids[0]];
    myExchangeListCell.titleLabel.text = [NSString stringWithFormat:@"title:%@",houseInfoDTOModel.name];
    myExchangeListCell.priceLabel.text = [NSString stringWithFormat:@"价格：%@",houseInfoDTOModel.price];
    return myExchangeListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
