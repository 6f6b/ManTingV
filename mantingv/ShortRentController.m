//
//  ShortRentController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/4.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentController.h"
#import "ShortRentCell.h"
#import "ChooserCell.h"
#import "ChooserView.h"

#import "ShortRentDetailController.h"
@interface ShortRentController ()

@end

@implementation ShortRentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"短租";
    
    //创建条件选择器
    NSArray *buttonTitles = @[@"选择目的地",@"选择价格",@"选择主题"];
    ChooserView *chooserView = [ChooserView shareChooserViewWith:CGPointMake(0, 0)];
    [chooserView setTitlesOfButtonWith:buttonTitles];
    [chooserView setDataArraysWith:@[@[@"11",@"21",@"31",@"5"],@[@"12",@"22",@"32"],@[@"13",@"23",@"33"]]];
    [chooserView setClickedAction:^(NSInteger indexOfDataAndButtons, NSIndexPath *indexPath) {
        
    }];
    [self.tableView addSubview:chooserView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ShortRentCell" bundle:nil] forCellReuseIdentifier:@"shortRentCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ChooserCell" bundle:nil] forCellReuseIdentifier:@"chooserCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!indexPath.row) {
        return 40;
    }
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell ;
    if (!indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"chooserCell"];
    }
    if (indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"shortRentCell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%lu",indexPath.row);
    ShortRentDetailController *shortRentDetailController = [[ShortRentDetailController alloc] init];
    [self.navigationController pushViewController:shortRentDetailController animated:YES];
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
