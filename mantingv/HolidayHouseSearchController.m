//
//  HolidayHouseSearchController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HolidayHouseSearchController.h"
#import "ThemeListController.h"
#import "ChooserView.h"

@interface HolidayHouseSearchController ()

@end

@implementation HolidayHouseSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建条件选择器
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, 0)];
    [chooserView setTitlesOfButtonWith:buttonTitles];
    [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
    [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
    [self.tableView addSubview:chooserView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HolidayHouseSearchCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooserCell" bundle:nil] forCellReuseIdentifier:@"chooserCell"];
    // Do any additional setup after loading the view.
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
