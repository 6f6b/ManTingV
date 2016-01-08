//
//  MyShortRentListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MyShortRentListController.h"
#import "MTSwitchView.h"
#import "RentListDTOModel.h"
#import "MyRentListCell.h"

@interface MyShortRentListController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation MyShortRentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的短租";

    NSArray *titles = @[@"正常",@"失效"];
    MTSwitchView *switchView = [MTSwitchView switchViewWithTitles:titles];
    [switchView setClickedAction:^(NSInteger index) {
        NSLog(@"%lu",index);
    }];
    _switchView = switchView;
    [self.view addSubview:switchView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.switchView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.switchView.frame)) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyRentListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyRentListCell class])];
    
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


#pragma mark - 实现tableView代理事件
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RentListDTOModel *rentListDTOModel = [RentListDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    MyRentListCell *myRentListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyRentListCell class])];
    [myRentListCell.backImage lfSetImageWithURL:rentListDTOModel.houseImageGuid[0]];
    myRentListCell.titleLab.text = rentListDTOModel.houseName;
    myRentListCell.priceLabel.text = [NSString stringWithFormat:@"价格：%@",rentListDTOModel.price];
    return myRentListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
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
