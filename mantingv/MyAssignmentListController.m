//
//  MyAssignmentListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MyAssignmentListController.h"
#import "MTSwitchView.h"
#import "MyAssignmentListCell.h"
#import "AssignmentDTOModel.h"
#import "myHouseDTOModel.h"
#import "HouseInfoDTOModel.h"
#import "HouseWeekDTOModel.h"
#import "HouseDetailController.h"
@interface MyAssignmentListController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,copy) NSString *appendingUrl;
@end

@implementation MyAssignmentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的转让";
    
    NSArray *urls = @[@"/my_house/assignment_list/",@"/my_house/assigning_list/"];
    self.appendingUrl = urls[0];
    
    NSArray *titles = @[@"正常",@"失效"];
    MTSwitchView *switchView = [MTSwitchView switchViewWithTitles:titles];
    [switchView setClickedAction:^(NSInteger index) {
        self.appendingUrl = urls[index-1000];
        [self loadDataFromServer];
    }];
    _switchView = switchView;
    [self.view addSubview:switchView];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.switchView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.switchView.frame));
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyAssignmentListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyAssignmentListCell class])];
    [self loadDataFromServer];
}


- (void)loadDataFromServer{
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:self.appendingUrl];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:[MTTools userGuid]];
    [KVNProgress showWithStatus:@"loading.."];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        [self.tableView reloadData];
        [KVNProgress dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
//    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyAssignmentListCell *myAssignmentListCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyAssignmentListCell class])];
    AssignmentDTOModel *assignmentDTOModel = [AssignmentDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    MyHouseDTOModel *myHouseDTOModel = [MyHouseDTOModel modelWithDictionary:assignmentDTOModel.myHouseDTO];
    HouseInfoDTOModel *houseInfoDTOModel = [HouseInfoDTOModel modelWithDictionary:myHouseDTOModel.houseInfoDTO];
    [myAssignmentListCell.headImage lfSetImageWithURL:houseInfoDTOModel.imageGuids[0]];
    myAssignmentListCell.titleLabel.text = [NSString stringWithFormat:@"title：%@",houseInfoDTOModel.name];
    myAssignmentListCell.priceLabel.text = [NSString stringWithFormat:@"价格:%@",houseInfoDTOModel.price];
    myAssignmentListCell.timeLabel.text = [NSString stringWithFormat:@"时间:"];
    return myAssignmentListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HouseDetailController *houseDetailController = [[HouseDetailController alloc] init];
    AssignmentDTOModel *assignmentDTOModel = [AssignmentDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    MyHouseDTOModel *myHouseDTOModel = [MyHouseDTOModel modelWithDictionary:assignmentDTOModel.myHouseDTO];
    HouseWeekDTOModel *houseWeekDTOModel = [HouseWeekDTOModel modelWithDictionary:myHouseDTOModel.houseWeekDTO];
    houseDetailController.houseWeekGuid = houseWeekDTOModel.guid;
//    NSLog(@"%@---%@",self.)
    [self.navigationController pushViewController:houseDetailController animated:YES];
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
