//
//  AccountConfigController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "AccountConfigController.h"
#import "ModifyIconController.h"
#import "ModifyNickNameController.h"
#import "ModifyPasswordController.h"

@interface AccountConfigController ()
@property (weak, nonatomic) IBOutlet UIView *modifyIcon;


@property (weak, nonatomic) IBOutlet UIView *modifyNickName;


@property (weak, nonatomic) IBOutlet UIView *modifyPassword;
@end

@implementation AccountConfigController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号设置";
    
    self.modifyIcon.tag = 101;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self.modifyIcon addGestureRecognizer:tap1];
    
    self.modifyNickName.tag = 102;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self.modifyNickName addGestureRecognizer:tap2];
    
    self.modifyPassword.tag = 103;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [self.modifyPassword addGestureRecognizer:tap3];

}

- (void)dealTap:(UITapGestureRecognizer *)tap{
    switch (tap.view.tag) {
        case 101:{
            ModifyIconController *modifyIconController = [[ModifyIconController alloc] init];
            modifyIconController.title = @"修改头像";
            [self.navigationController pushViewController:modifyIconController animated:YES];
        }
            break;
        case 102:{
            ModifyNickNameController *modifyNickNameController= [[ModifyNickNameController alloc] init];
            modifyNickNameController.title = @"修改昵称";
            [self.navigationController pushViewController:modifyNickNameController animated:YES];
        }
            break;
        case 103:{
            ModifyPasswordController *modifyPasswordController = [[ModifyPasswordController alloc] init];
            modifyPasswordController.title = @"我的密码";
            [self.navigationController pushViewController:modifyPasswordController animated:YES];
        }
            break;
 
        default:
            break;
    }
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
