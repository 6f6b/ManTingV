//
//  AgreementController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/7.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AgreementController.h"
#import "YYLabel.h"

@interface AgreementController ()
@property (nonatomic,weak) UITextView *agreementLabel;
@end

@implementation AgreementController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlWithOutHouseInfoGuid = [BASE_URL stringByAppendingString:@"/order/agreement/"];
    NSString *url = [urlWithOutHouseInfoGuid stringByAppendingString:self.houseInfoGuid];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *agreementDTO = [dic objectForKey:@"data"];
        NSString *webString = [agreementDTO objectForKey:@"content"];
        UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [web loadHTMLString:webString baseURL:nil];
        [self.view addSubview:web];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
    // Do any additional setup after loading the view.
}

- (UITextView *)agreementLabel{
    if (nil == _agreementLabel) {
        UITextView *agreementLabel = [[UITextView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:agreementLabel];
        _agreementLabel = agreementLabel;
    }
    return _agreementLabel;
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
