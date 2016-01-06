//
//  AddressContentView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddressContentView.h"
#import "AddAddressView.h"
#import "RecipientInformationView.h"
#import "MTPayController.h"

@interface AddressContentView ()
@property (nonatomic,weak) AddAddressView *addAddressView;
@property (nonatomic,weak) RecipientInformationView *recipientInformationView;
@property (nonatomic,strong) AFHTTPSessionManagerForMT *manager;
@end
@implementation AddressContentView



- (AddAddressView *)addAddressView{
    if (nil == _addAddressView) {
        AddAddressView *addAddressView = [[AddAddressView alloc] initWithFrame:self.bounds];
        addAddressView.controller = self.controller;
        addAddressView.backgroundColor = [UIColor greenColor];
        [self addSubview:addAddressView];
        _addAddressView = addAddressView;
    }
    return _addAddressView;
}

- (RecipientInformationView *)recipientInformationView{
    if (nil == _recipientInformationView) {
        RecipientInformationView *recipientInformationView = [[RecipientInformationView alloc] initWithFrame:self.bounds];
        recipientInformationView.controller = self.controller;
        recipientInformationView.backgroundColor = [UIColor greenColor];
        [self addSubview:recipientInformationView];
        _recipientInformationView = recipientInformationView;
    }
    return _recipientInformationView;
}

- (void)setValueWith:(id)data{
    //检测是否登录
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    if (nil == userGuid) {
        [self.addAddressView setValueWith:nil];
        return;
    }
    
    //检测地址是列表是否为空
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:@"/order/find_address/"];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:userGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        //如果地址列表为空
        if (0 == arr.count) {
            [self.addAddressView setValueWith:nil];
        }
        
        //如果不为空,默认设置第一个联系地址
        if (0 != arr.count) {
            MTPayController *payController = (MTPayController *)self.controller;
            [self.recipientInformationView setValueWith:arr[payController.addressTag]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (AFHTTPSessionManagerForMT *)manager{
    if (nil == _manager) {
        _manager = [AFHTTPSessionManagerForMT manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _manager;
}
@end
