//
//  MTPayController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTPayController.h"

#import "MTPayContentScrollView.h"

@interface MTPayController ()
@property (nonatomic,weak) MTPayContentScrollView *payContentScrollView;

@property (nonatomic,weak) UILabel *totalPriceLabel;
@property (nonatomic,weak) UIButton *payButton;
@end

@implementation MTPayController

- (id)init{
    if(self = [super init]){
        _addressTag = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    if (nil != self.themeListViewModel.price) {
        double totalPrice = self.payContentScrollView.purchaseQuantityView.purchaseQuantityStepper.value*[self.themeListViewModel.price doubleValue];
        self.totalPrice = totalPrice;
    }
    
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@50);
        make.right.equalTo(self.payButton.mas_left);
    }];
    
    [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@50);
        make.width.equalTo(self.totalPriceLabel);
    }];
}

- (void)loadData{
    [self.payContentScrollView setValueWith:nil];
}

- (void)setTotalPrice:(double)totalPrice{
    _totalPrice = totalPrice;
    NSString *totalPriceString = [NSString stringWithFormat:@"金额：%0.2f",totalPrice];
    NSLog(@"%@",totalPriceString);
    self.totalPriceLabel.text = totalPriceString;
}

- (UIButton *)payButton{
    if (nil == _payButton) {
        UIButton *payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [payButton setBackgroundColor:[UIColor orangeColor]];
        [payButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [payButton addTarget:self action:@selector(dealPay) forControlEvents:UIControlEventTouchUpInside];
        _payButton = payButton;
        [self.view addSubview:payButton];
    }
    return _payButton;
}

- (void)dealPay{
    NSDictionary *parameter = [self getParameter];
    NSString *url = [BASE_URL stringByAppendingString:@"/order/before_pay"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *result = [dic objectForKey:@"result"];
        //失败则返回
        if ([result isEqualToString:@"ERROR"]) {
            NSLog(@"错误");
            return ;
        }
        
        //成功则发起支付
        if ([result isEqualToString:@"SUCCESS"]) {
            NSString *oderGuid = [dic objectForKey:@"data"];
            
            NSString *urlWithOutOderGuid = [BASE_URL stringByAppendingString:@"/order/alipay/"];
            NSString *url = [urlWithOutOderGuid stringByAppendingString:oderGuid];
            NSLog(@"%@",url);
            [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"————————————》支付结果:%@",dic);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/**
 *  获取支付前的POST参数
 *
 *  @return 返回支付前的POST参数
 */
- (NSDictionary *)getParameter{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:self.themeListViewModel.guid forKey:@"houseWeekGuid"];
    NSString *buyNum = [NSString stringWithFormat:@"%lu",(NSInteger)self.payContentScrollView.purchaseQuantityView.purchaseQuantityStepper.value];
    [parameter setValue:buyNum forKey:@"buyNum"];
    
    [parameter setValue:[NSString stringWithFormat:@"%f",self.totalPrice] forKey:@"totalPrice"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    [parameter setValue:userGuid forKey:@"userGuid"];
    
    [parameter setValue:self.payContentScrollView.addressContentView.addressGuid forKey:@"addressGuid"];
    return parameter;
}

- (UILabel *)totalPriceLabel{
    if (nil == _totalPriceLabel) {
        UILabel *totalPriceLabel = [[UILabel alloc] init];
        totalPriceLabel.backgroundColor = [UIColor colorWithRed:0.989 green:1.000 blue:0.962 alpha:1.000];
        NSString *totalPriceString = [NSString stringWithFormat:@"应付金额：%f",self.totalPrice];
        totalPriceLabel.text = totalPriceString;
        [self.view addSubview:totalPriceLabel];
        _totalPriceLabel = totalPriceLabel;
    }
    return _totalPriceLabel;
}

- (MTPayContentScrollView *)payContentScrollView{
    if (nil == _payContentScrollView) {
        MTPayContentScrollView *payContentScrollView = [[MTPayContentScrollView alloc] initWithFrame:self.view.bounds];
        payContentScrollView.controller = self;
        payContentScrollView.backgroundColor = [UIColor whiteColor];
        _payContentScrollView = payContentScrollView;
        [self.view addSubview:_payContentScrollView];
    }
    return _payContentScrollView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.payContentScrollView setValueWith:self.themeListViewModel];
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
