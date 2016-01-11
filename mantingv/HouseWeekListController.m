//
//  HouseWeekListController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/11.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "HouseWeekListController.h"
#import "HouseWeekListCell.h"
#import "HouseWeekTimeDTOModel.h"
#import "INeedCheckInDetailController.h"

@interface HouseWeekListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation HouseWeekListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HouseWeekListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HouseWeekListCell class])];
    _tableView = tableView;
    [self.view addSubview:tableView];
    
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HouseWeekListCell *houseWeekListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HouseWeekListCell class])];
    HouseWeekTimeDTOModel *houseWeekTimeDTOModel = [HouseWeekTimeDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    houseWeekListCell.startLabel.text = [NSString stringWithFormat:@"入住时间：%@",houseWeekTimeDTOModel.start];
    houseWeekListCell.endLabel.text = [NSString stringWithFormat:@"离店时间：%@",houseWeekTimeDTOModel.end];
    return houseWeekListCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController popViewControllerAnimated:YES];
    INeedCheckInDetailController *iNeedCheckInDetailController = [self.navigationController.viewControllers lastObject];
    iNeedCheckInDetailController.indexOfhouseWeekGuid = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPathP{
    return 84;
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
