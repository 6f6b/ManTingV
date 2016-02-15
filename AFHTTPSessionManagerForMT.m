//
//  AFHTTPSessionManagerForMT.m
//  mantingv
//
//  Created by LiuFeng on 15/12/30.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "AFHTTPSessionManagerForMT.h"

@implementation AFHTTPSessionManagerForMT
- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    void (^myblock) (NSURLSessionDataTask *task, id _Nullable responseObject);
    myblock = ^(NSURLSessionDataTask *task, id _Nullable responseObject){
        success(task,responseObject);
    };
    
    //如果网络加载失败，注销HUD，并且显示错误
    void (^myErrorBlock)(NSURLSessionDataTask * _Nullable task, NSError *error);
    myErrorBlock = ^(NSURLSessionDataTask * _Nullable task, NSError *error){
        failure(task,error);
        [KVNProgress dismiss];
        
        [KVNProgress showErrorWithStatus:@"网络请求出错"];
//        UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"网络请求发生错误" message:@"确定" preferredStyle:UIAlertControllerStyleAlert];
//        [alterController showViewController:alterController sender:nil];
    };
    
    NSURLSessionDataTask *task = [super GET:URLString parameters:parameters progress:downloadProgress success:myblock failure:myErrorBlock];
    return task;
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    void (^myblock) (NSURLSessionDataTask *task, id _Nullable responseObject);
    myblock = ^(NSURLSessionDataTask *task, id _Nullable responseObject){
        success(task,responseObject);

    };
    NSURLSessionDataTask *task = [super POST:URLString parameters:parameters progress:uploadProgress success:myblock failure:failure];
    return task;
}
@end
