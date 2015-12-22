//
//  INeedCheckInController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/22.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "INeedCheckInController.h"
#import "INeedCheckInCell.h"
#import "INeedCheckInDetailController.h"

@interface INeedCheckInController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@end

@implementation INeedCheckInController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView{
    if (nil == _tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:tableView];
        [tableView registerNib:[UINib nibWithNibName:@"INeedCheckInCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark - 实现tableview中的协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    INeedCheckInCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.cycle.text = @"";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 109;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    INeedCheckInDetailController *iNeedCheckInDetailController = [[INeedCheckInDetailController alloc] init];
    [self.navigationController pushViewController:iNeedCheckInDetailController animated:YES];
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
