//
//  MyCheckInListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MyCheckInListController.h"

@interface MyCheckInListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation MyCheckInListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的入住";
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/my_house/reserve_list/"];
    NSString *url = [urlWithOutGuid stringByAppendingString:userGuid];
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
//        [ZJModelTool createModelWithDictionary:arr[0] modelName:nil];
        if (0 == arr.count) {
            [KVNProgress showErrorWithStatus:@"sorr！you have no vacation house yet"];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (UITableView *)tableView{
    if (nil == _tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark - 代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"我的入住";
    return cell;
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
