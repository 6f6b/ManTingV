//
//  ModifyPasswordController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ModifyPasswordController.h"

@interface ModifyPasswordController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *originalPasswordTextFeild;

@property (weak, nonatomic) IBOutlet UITextField *newpasswordTextFeild;

@property (weak, nonatomic) IBOutlet UITextField *repeatNewPasswordTextFeild;

@property (nonatomic,strong) NSMutableDictionary *parameters;

@end

@implementation ModifyPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originalPasswordTextFeild.delegate = self;
    self.newpasswordTextFeild.delegate = self;
    self.repeatNewPasswordTextFeild.delegate = self;

    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.originalPasswordTextFeild resignFirstResponder];
    [self.newpasswordTextFeild resignFirstResponder];
    [self.repeatNewPasswordTextFeild resignFirstResponder];
    return YES;
}

- (IBAction)commitBtn:(id)sender {
    //设置userGuid
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    [self.parameters setValue:userGuid forKey:@"userGuid"];
    
    //原密码
    [self.parameters setValue:self.originalPasswordTextFeild.text forKey:@"oldPassword"];
    
    //新秘密
    [self.parameters setValue:self.newpasswordTextFeild.text forKey:@"newPassword"];
    
    //重复新密码
    [self.parameters setValue:self.repeatNewPasswordTextFeild.text forKey:@"rePassword"];
    
    NSLog(@"%@",self.parameters);
    //发起修改请求
    NSString *url = [BASE_URL stringByAppendingString:@"/user/modify_pwd"];
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary *)parameters{
    if (nil == _parameters) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *userGuid = [user objectForKey:USER_GUID];
        NSDictionary *dic = @{@"userGuid":@"",
                              @"oldPassword":@"",
                              @"newPassword":@"",
                              @"rePassword":@"",
                              };
        NSMutableDictionary *parameters = [[NSMutableDictionary alloc] initWithDictionary:dic];
        _parameters = parameters;
    }
    return _parameters;
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
