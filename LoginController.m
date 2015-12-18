//
//  LoginController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFeild;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextFeild;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//登录相关操作
- (IBAction)loginBtn:(id)sender {
    NSString *useraccount = self.phoneNumberTextFeild.text;
    NSString *password = self.passWordTextFeild.text;
    if (nil == useraccount) {
        return;
    }
    if (nil == password) {
        return;
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:useraccount forKey:USER_ACCOUNT];
    [user setObject:password forKey:USER_PASSWORD];
    
//    NSLog(@">>>>>>>>>>%@",NSStringFromClass([self.willPushVC class]));
    if (nil == NSStringFromClass([self.willPushVC class])) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    [self.navigationController pushViewController:self.willPushVC animated:YES];
    [self removeFromParentViewController];
}

//忘记密码按钮
- (IBAction)forgetPassWordBtn:(id)sender {
}

//注册按钮
- (IBAction)registerBtn:(id)sender {
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
