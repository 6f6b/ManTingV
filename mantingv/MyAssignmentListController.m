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

@interface MyAssignmentListController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation MyAssignmentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的转让";
    
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:@"/my_house/assignment_list/"];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGui = [user objectForKey:USER_GUID];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:userGui];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        if (0 == arr.count) {
            [KVNProgress showErrorWithStatus:@"数据为空"];
            return ;
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSArray *titles = @[@"正常",@"失效"];
    MTSwitchView *switchView = [MTSwitchView switchViewWithTitles:titles];
//    [switchView setClickedAction:^(NSInteger index) {
//        NSLog(@"%lu",index);
//    }];
    _switchView = switchView;
    [self.view addSubview:switchView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (UITableView *)tableView{
    if (nil == _tableView) {
        NSLog(@"%@",self.switchView);
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.switchView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.switchView.frame)) style:UITableViewStylePlain];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyAssignmentListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyAssignmentListCell class])];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
        [self.view addSubview:tableView];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataArray.count;
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyAssignmentListCell *myAssignmentListCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyAssignmentListCell class])];
    return myAssignmentListCell;
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
