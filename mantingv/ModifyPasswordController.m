//
//  ModifyPasswordController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ModifyPasswordController.h"

@interface ModifyPasswordController ()
@property (weak, nonatomic) IBOutlet UITextField *originalPasswordTextFeild;

@property (weak, nonatomic) IBOutlet UITextField *newpasswordTextFeild;

@property (weak, nonatomic) IBOutlet UITextField *repeatNewPasswordTextFeild;

@end

@implementation ModifyPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)commitBtn:(id)sender {
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
