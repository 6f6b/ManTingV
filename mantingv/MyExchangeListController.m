//
//  MyExchangeListController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/8.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MyExchangeListController.h"
#import "MyExchangeListCell.h"
#import "ExchangePoolDTOModel.h"

@interface MyExchangeListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation MyExchangeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的交换";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyExchangeListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyExchangeListCell class])];
    
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:@"/my_house/rent_list_lessee/"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:userGuid];
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    // Do any additional setup after loading the view.
}

#pragma mark - 代理方法实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ExchangePoolDTOModel *exchangePoolDTOModel = [ExchangePoolDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    MyExchangeListCell *myExchangeListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyExchangeListCell class])];
    return myExchangeListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
