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

#import "UMSocialSnsService.h"
#import "UMSocial.h"
@interface MyShortRentListController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,copy) NSString *appendingUrl;
@end

@implementation MyShortRentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的短租";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Share_20.16690647482px_1183447_easyicon.net"] style:UIBarButtonItemStyleDone target:self action:@selector(dealRightItem)];
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
//    [self.navigationItem.rightBarButtonItem backgroundImageForState:UIControlStateNormal barMetrics:uibar];
    self.navigationItem.rightBarButtonItem = rightItem;
//    UIImageView *imagev = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7"]];
//    self.navigationItem.titleView = imagev;
    
    NSArray *urls = @[@"/my_house/rent_list_lessee/",@"/my_house/rent_list_hirer/"];
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
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyRentListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyRentListCell class])];
    
    [self loadDataFromServer];
    // Do any additional setup after loading the view.
}

- (void)dealRightItem{
    NSLog(@"分享");
    UIImage *image = [UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7"];
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeMusic url:@"http://music.huoxing.com/upload/20130330/1364651263157_1085.mp3"];
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"56975b9467e58e3593001c47" shareText:@"www.baidu.com" shareImage:image shareToSnsNames:nil delegate:self];
}

- (void)loadDataFromServer{
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:self.appendingUrl];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:[MTTools userGuid]];
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
