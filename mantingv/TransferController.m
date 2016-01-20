//
//  TransferController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "TransferController.h"
#import "TransferContentScrollView.h"

@interface TransferController ()
@property (nonatomic,weak) TransferContentScrollView *transferContentScrollView;
@end

@implementation TransferController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //先将我的houseGuid放入装让池
    NSString *urlWithOutMyHouseGuid = [BASE_URL stringByAppendingString:@"/assignment/init/"];
    NSString *url = [urlWithOutMyHouseGuid stringByAppendingString:self.myHouseGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *result = [dic objectForKey:@"result"];
        if ([result isEqualToString:@"SUCCESS"]) {
            [KVNProgress showSuccessWithStatus:@"OK"];
        }
        else{
            [KVNProgress showErrorWithStatus:result];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [self.transferContentScrollView setValueWith:nil];
    
    
}


- (TransferContentScrollView *)transferContentScrollView{
    if (nil == _transferContentScrollView) {
        TransferContentScrollView *transferContentScrollView = [[TransferContentScrollView alloc] initWithFrame:self.view.bounds];
        _transferContentScrollView = transferContentScrollView;
        transferContentScrollView.controller = self;
//        [transferContentScrollView.chooserView setDataArraysWith:arr];
        [self.view addSubview:transferContentScrollView];
    }
    return _transferContentScrollView;
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
