//
//  RegisterController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/31.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextFiled;

@property (weak, nonatomic) IBOutlet UITextField *identifyingCode;
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    // Do any additional setup after loading the view from its nib.
}

/**
 *  获取验证码
 *
 *  @param sender <#sender description#>
 */
- (IBAction)getIdentifyingCode:(id)sender {
    if ([@""  isEqual: self.phoneNumberTextFiled.text]) {
        [KVNProgress showErrorWithStatus:@"请输入手机号"];
        return;
    }
    NSString *urlWithOutUserName = [BASE_URL stringByAppendingString:@"/reg/send_valid_num/"];
    NSString *urlWithUserName = [urlWithOutUserName stringByAppendingString:self.phoneNumberTextFiled.text];
    [self.manager GET:urlWithUserName parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        id x = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/**
 *  提交注册信息
 *
 *  @param sender <#sender description#>
 */
- (IBAction)commitButton:(id)sender {
    
    if ([@""  isEqual: self.phoneNumberTextFiled.text]) {
        [KVNProgress showErrorWithStatus:@"号码有错"];
        return;
    }
    if ([@""  isEqual: self.loginPasswordTextFiled.text]) {
        [KVNProgress showErrorWithStatus:@"密码有错"];
        return;
    }
    if ([@""  isEqual: self.confirmPasswordTextFiled.text]) {
        [KVNProgress showErrorWithStatus:@"密码有错"];
        return;
    }
    if ([@""  isEqual: self.identifyingCode.text]) {
        [KVNProgress showErrorWithStatus:@"请输入验证码"];
        return;
    }
    if(![self.loginPasswordTextFiled.text isEqualToString:self.confirmPasswordTextFiled.text]){
        [KVNProgress showErrorWithStatus:@"两次密码不一致"];
        return;
    }
    NSString *url = [BASE_URL stringByAppendingString:@"/reg/form"];
    NSDictionary *parameters = @{@"username":self.phoneNumberTextFiled.text,
                                 @"password":self.loginPasswordTextFiled.text,
                                 @"rePassword":self.confirmPasswordTextFiled.text,
                                 @"validationNum":self.identifyingCode.text,
                                 };
    NSLog(@"%@",parameters);
    [KVNProgress showWithStatus:@"加载中。。"];
    [self.manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [KVNProgress dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        NSString *result = [dic objectForKey:@"result"];
        
        if([result isEqualToString:@"USER_IS_EXIST"]){
            [KVNProgress showErrorWithStatus:@"账号已存在"];
            return ;
        }
        
        if ([result isEqualToString:@"VALIDA_NUM_ERROR"]) {
            [KVNProgress showErrorWithStatus:@"注册失败"];
            return ;
        }
        if ([result isEqualToString:@"SUCCESS"]) {
            [KVNProgress showSuccessWithStatus:@"注册成功！"];
            
            //将登录controller从navigationcontroller的Controllers中删除直接调回到登录之前的界面
            NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
            [viewControllers removeObjectAtIndex:viewControllers.count-2];
            self.navigationController.viewControllers = viewControllers;
            
            //将服务器返回的userGuid写入沙盒中
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:[dic objectForKey:@"data"] forKey:USER_GUID];
            
            //pop回去
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
