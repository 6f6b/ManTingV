
//
//  BookOrderController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BookOrderController.h"

@interface BookOrderController ()
@property (weak, nonatomic) IBOutlet UILabel *advancePaymentLabel;
@property (weak, nonatomic) IBOutlet UILabel *earnestMoneyLabel;

@end

@implementation BookOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.advancePaymentLabel.text = [NSString stringWithFormat:@"预付价：￥%@",self.earnestMoney];
    self.earnestMoneyLabel.text = [NSString stringWithFormat:@"%@",self.earnestMoney];

    // Do any additional setup after loading the view from its nib.
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
