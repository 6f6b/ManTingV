//
//  ResettingController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ResettingController.h"

@interface ResettingController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *verifyTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextFiled;
@end

@implementation ResettingController


/**
 *  向输入的手机号码发送验证码
 *
 *  @param sender
 */
- (IBAction)sendVerifyCode:(id)sender {
    NSString *urlWithOutPhoneNumber = [BASE_URL stringByAppendingString:@"/user/reset_pwd_valid/"];
    NSString *url = [urlWithOutPhoneNumber stringByAppendingString:self.phoneNumberTextFiled.text];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [KVNProgress showSuccessWithStatus:@"验证码发送成功"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/**
 *  提交修改密码信息
 *
 *  @param sender
 */
- (IBAction)commitButton:(id)sender {
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:self.phoneNumberTextFiled.text forKey:@"phoneNum"];
    [parameter setValue:self.verifyTextFiled.text forKey:@"validNum"];
    [parameter setValue:self.passwordTextFiled.text forKey:@"newPassword"];
    [parameter setValue:self.confirmPasswordTextFiled.text forKey:@"rePassword"];
    
    NSString *url = [BASE_URL stringByAppendingString:@"/user/reset_pwd"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [KVNProgress showSuccessWithStatus:@"重置密码成功!"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
