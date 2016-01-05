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

@interface LoginController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFeild;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextFeild;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNumberTextFeild.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"okkkk");
    [textField resignFirstResponder];
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
        NSLog(@"waht");
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
