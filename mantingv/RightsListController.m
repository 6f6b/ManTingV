//
//  RightsListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RightsListController.h"
#import "MyHouseListCell.h"
#import "MyHouseListModel.h"
#import "HouseInfoDTOModel.h"
#import "HouseWeekDTOModel.h"
#import "MyHouseListDetailController.h"
@interface RightsListController ()
//@property (nonatomic,weak) UITableView *tableView;
//@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation RightsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"权益列表";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyHouseListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyHouseListCell class])];
    [self loadDataFromServer];
   
}

#pragma mark - 从服务器下载数据
- (void)loadDataFromServer{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/my_house/list/%@",userGuid]];
    NSLog(@"---------->%@",url);
    [KVNProgress showWithStatus:@"加载中。。"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSLog(@"----->%@",arr);
        [KVNProgress dismiss];
        self.dataArray = [[NSMutableArray alloc] initWithArray:arr];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}

#pragma mark - 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",self.dataArray.count);
    return self.dataArray.count;
}


/**
 *  为cell上的控件赋值
 *
 *  @param tableView
 *  @param indexPath
 *
 *  @return 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyHouseListCell *myHouseListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyHouseListCell class])];
    MyHouseListModel *myHouseListModel = [MyHouseListModel modelWithDictionary:self.dataArray[indexPath.row]];
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:myHouseListModel.houseInfoDTO];
    HouseWeekDTOModel *houseWeekDTOModel = [HouseWeekDTOModel modelWithDictionary:myHouseListModel.houseWeekDTO];
    
    myHouseListCell.titleLabel.text = houseInfoDTOModel.name;
    [myHouseListCell.backImage lfSetImageWithURL:houseInfoDTOModel.imageGuids[0]];
    myHouseListCell.priceLabel.text =houseWeekDTOModel.price;
    
    return myHouseListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84;
}

/**
 *  点击跳转到详情界面
 *
 *  @param tableView
 *  @param indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyHouseListDetailController *myHouseListDetailController = [[MyHouseListDetailController alloc] init];
    MyHouseListModel *myHouseListModel = [MyHouseListModel modelWithDictionary:self.dataArray[indexPath.row]];
    myHouseListDetailController.myHouseGuid = myHouseListModel.guid;
    [self.navigationController pushViewController:myHouseListDetailController animated:YES];
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
