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
        NSLog(@"加载成功");
        [KVNProgress dismiss];
    };
    NSLog(@"加载中。。");
    [KVNProgress showWithStatus:@"加载中.."];
    NSURLSessionDataTask *task = [super GET:URLString parameters:parameters progress:downloadProgress success:myblock failure:failure];
    return task;
}

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    void (^myblock) (NSURLSessionDataTask *task, id _Nullable responseObject);
    myblock = ^(NSURLSessionDataTask *task, id _Nullable responseObject){
        success(task,responseObject);
//        NSLog(@"加载成功");
        [KVNProgress dismiss];
    };
    [KVNProgress showWithStatus:@"加载中.."];
    NSURLSessionDataTask *task = [super POST:URLString parameters:parameters progress:uploadProgress success:myblock failure:failure];
    return task;
}
@end
