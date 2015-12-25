//
//  HolidayHouseSearchController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HolidayHouseSearchController.h"
#import "ThemeListController.h"

@interface HolidayHouseSearchController ()

@end

@implementation HolidayHouseSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *url = [BASE_URL stringByAppendingString:@"/house/list"];
    [manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"HolidayHouseSearchCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooserCell" bundle:nil] forCellReuseIdentifier:@"chooserCell"];
    // Do any additional setup after loading the view.
}

- (ChooserView *)chooserView{
    if (nil == _chooserView) {
        //创建条件选择器
        NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
        ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, 0)];
        [chooserView setTitlesOfButtonWith:buttonTitles];
        [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
            
        }];
        _chooserView = chooserView;
        [self.tableView addSubview:chooserView];
    }
    return _chooserView;
}

- (NSMutableDictionary *)parameters{
    if (nil == _parameters) {
        NSDictionary *dictionary = @{@"houseBaseName":@"",              //搜索框
                                     @"houseBaseArea":@"NOT_LIMIT",     //目的地
                                     @"houseBaseTheme":@"NOT_LIMIT",    //主题
                                     @"houseBasePrice":@"NOT_LIMIT",    //价格
                                     @"productType":@"HOUSEBASE",
                                     @"pageSize":@"100",
                                     @"currentPage":@"1"
                                     };
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
        _parameters = dic;
    }
    return _parameters;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (!indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"chooserCell"];
    }
    
    if (indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!indexPath.row) {
        return 40;
    }
    return 181;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ThemeListController *themeListController = [[ThemeListController alloc] init];
    [self.navigationController pushViewController:themeListController animated:YES];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation

@end
