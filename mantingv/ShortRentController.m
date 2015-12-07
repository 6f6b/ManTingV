//
//  ShortRentController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/4.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ShortRentController.h"
#import "ShortRentCell.h"
#import "shortRentAdCell.h"

@interface ShortRentController ()

@end

@implementation ShortRentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShortRentCell" bundle:nil] forCellReuseIdentifier:@"shortRentCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"shortRentAdCell" bundle:nil] forCellReuseIdentifier:@"shortRentAdCell"];
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
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (0 == indexPath.row) {
        shortRentAdCell *shortRentAdCell = [self.tableView dequeueReusableCellWithIdentifier:@"shortRentAdCell"];
        cell = shortRentAdCell;
    }
    else{
        ShortRentCell *shortRentCell = [self.tableView dequeueReusableCellWithIdentifier:@"shortRentCell"];
        cell = shortRentCell;
    }
    return cell;
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
