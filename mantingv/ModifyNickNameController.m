//
//  ModifyNickNameController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ModifyNickNameController.h"

@interface ModifyNickNameController ()

@property (weak, nonatomic) IBOutlet UITextField *newnickNameTextFeild;

@end

@implementation ModifyNickNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)commitBtn:(id)sender {
    [self loadPersonInformationFromServer];
}

- (void)loadPersonInformationFromServer{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *guid = [user objectForKey:USER_GUID];
    
    NSString *urlWithOutGuid = [BASE_URL stringByAppendingString:@"/user/user_info/"];
    NSString *urlWithGuid = [urlWithOutGuid stringByAppendingString:guid];
    
    [self.manager GET:urlWithGuid parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *data = [dic objectForKey:@"data"];
        [self refreshDataInServerWith:data];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)refreshDataInServerWith:(id )data{
    UserAccount *userAccount = [UserAccount modelWithDictionary:data];
    [ZJModelTool createModelWithDictionary:data modelName:nil];
    NSMutableDictionary *dic = [userAccount mj_keyValues];
    [dic setValue:self.newnickNameTextFeild.text forKey:@"username"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    [dic setValue:userGuid forKey:@"userGuid"];
    
    NSLog(@"%@",dic);
    
    NSString *url = [BASE_URL stringByAppendingString:@"/user/update"];
    [self.manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"--------->%@",dic);
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
