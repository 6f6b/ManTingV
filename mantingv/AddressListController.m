//
//  AddressListController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddressListController.h"
#import "AddressListCell.h"
#import "MTPayController.h"
#import "AddAddressCell.h"
#import "AddAddressController.h"

@interface AddressListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation AddressListController
- (id)init{
    if (self = [super init]) {
        self.isNeedToCheckLogin = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AddressListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AddressListCell class])];
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AddAddressCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([AddAddressCell class])];
    _tableView = tableView;
    [self loadDataFromServer];
}

/**
 *  从服务器加载地址列表
 */
- (void)loadDataFromServer{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:@"/order/find_address/"];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:userGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSLog(@"%lu",arr.count);
        self.dataArray = arr;
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 实现代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row<self.dataArray.count) {
        AddressListCell *addressListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AddressListCell class])];
        [addressListCell setValueWith:self.dataArray[indexPath.row]];
        cell = addressListCell;
    }
    
    if (self.dataArray.count == indexPath.row) {
        AddAddressCell *addAddressCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AddAddressCell class])];
        cell = addAddressCell;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.dataArray.count) {
        AddAddressController *addAddressController = [[AddAddressController alloc] init];
        [self.navigationController pushViewController:addAddressController animated:YES];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
    MTPayController *payController = [self.navigationController.viewControllers lastObject];
    payController.addressTag = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 81;
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
