//
//  LoginController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"
#import "ResettingController.h"
#import <QuartzCore/QuartzCore.h>
@interface LoginController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFeild;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextFeild;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNumberTextFeild.delegate = self;
    self.phoneNumberTextFeild.borderStyle = UITextBorderStyleLine;
    self.phoneNumberTextFeild.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.phoneNumberTextFeild.layer.borderWidth = 1.0;
    UIImageView *phoneLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 15, 20)];
    phoneLeftImageView.image = [UIImage imageNamed:@"phonenumber"];
    self.phoneNumberTextFeild.leftView = phoneLeftImageView;
    self.phoneNumberTextFeild.leftViewMode = UITextFieldViewModeAlways;
    
    self.passWordTextFeild.delegate = self;
    self.passWordTextFeild.borderStyle = UITextBorderStyleLine;
    self.passWordTextFeild.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.passWordTextFeild.layer.borderWidth = 1.0;
    UIImageView *passLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 15, 20)];
    passLeftImageView.image = [UIImage imageNamed:@"password"];
    self.passWordTextFeild.leftView = passLeftImageView;
    self.passWordTextFeild.leftViewMode = UITextFieldViewModeAlways;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.phoneNumberTextFeild resignFirstResponder];
    [self.passWordTextFeild resignFirstResponder];
    return YES;
}


//登录相关操作
- (IBAction)loginBtn:(id)sender {
    [self.passWordTextFeild resignFirstResponder];
    NSString *useraccount = self.phoneNumberTextFeild.text;
    NSString *password = self.passWordTextFeild.text;
    NSDictionary *parameters = @{@"username":useraccount,
                                 @"password":password
                                 };
    NSString *url = [BASE_URL stringByAppendingString:@"/login/in"];
    [self.manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self loginWith:dic];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)loginWith:(id)data{
    NSString *guid = [data objectForKey:@"data"];
    NSLog(@"------->%@<",guid);
    if (nil == guid) {
        return;
    }
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:guid forKey:USER_GUID];
    
    if (nil == NSStringFromClass([self.willPushVC class])) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    [self.navigationController pushViewController:self.willPushVC animated:YES];
    
    NSMutableArray *navArray= [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
    self.navigationController.viewControllers = navArray;
    [navArray removeObject:self];

}

//忘记密码按钮
- (IBAction)forgetPassWordBtn:(id)sender {
    ResettingController *resettingController = [[ResettingController alloc] init];
    [self.navigationController pushViewController:resettingController animated:YES];
}

//注册按钮
- (IBAction)registerBtn:(id)sender {
    RegisterController *registerController = [[RegisterController alloc] init];
    [self.navigationController pushViewController:registerController animated:YES];
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
