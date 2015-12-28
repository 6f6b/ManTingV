//
//  UserAccount.m
//  mantingv
//
//  Created by LiuFeng on 15/12/10.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "UserAccount.h"
@interface UserAccount()
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@end
@implementation UserAccount
//+ (instancetype)shareInstance{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    UserAccount *userAccount = [user objectForKey:USER_ACCOUNT];
//    return userAccount;
//}

//    static UserAccount *userAccount;
//    if (nil == userAccount) {
//        userAccount = [[UserAccount alloc] init];
//    }
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *guid = [user objectForKey:USER_GUID];
//    NSString *url = [BASE_URL stringByAppendingString:[NSString stringWithFormat:@"/user/user_info/%@",guid]];
//    [userAccount.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSDictionary *detail = [dic objectForKey:@"data"];
//        [userAccount setValuesForKeysWithDictionary:detail];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];

- (AFHTTPSessionManager *)manager{
    if (nil == _manager) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager = manager;
    }
    return _manager;
}
@end
