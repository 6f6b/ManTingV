//
//  PropertyRightCenterController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "PropertyRightCenterController.h"
#import "ExchangeController.h"
#import "TransferController.h"
@interface PropertyRightCenterController ()

@end

@implementation PropertyRightCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

////////////////////////////////////////交换////////////////////////////////////////
- (IBAction)exchange:(id)sender {
    ExchangeController *exchangeController = [[ExchangeController alloc] init];
    [self.navigationController pushViewController:exchangeController animated:YES];
    
}

////////////////////////////////////////转让////////////////////////////////////////
- (IBAction)transfer:(id)sender {
    TransferController *transferController = [[TransferController alloc] init];
    [self.navigationController pushViewController:transferController animated:YES];
}

////////////////////////////////////////入住////////////////////////////////////////

- (IBAction)checkIn:(id)sender {
}

////////////////////////////////////////帮助////////////////////////////////////////
- (IBAction)help:(id)sender {
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
