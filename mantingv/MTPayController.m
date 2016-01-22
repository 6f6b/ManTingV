//
//  MTPayController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTPayController.h"
#import "MTPayContentScrollView.h"

#import "Order.h"
#import <AlipaySDK/AlipaySDK.h>
#import "DataSigner.h"

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

- (MTPayContentScrollView *)payContentScrollView{
    if (nil == _payContentScrollView) {
        MTPayContentScrollView *payContentScrollView = [[MTPayContentScrollView alloc] initWithFrame:self.view.bounds];
        payContentScrollView.controller = self;
        payContentScrollView.backgroundColor = [UIColor colorWithRed:(float)239/255 green:(float)239/255 blue:(float)239/255 alpha:1.000];
        _payContentScrollView = payContentScrollView;
        [self.view addSubview:_payContentScrollView];
    }
    return _payContentScrollView;
}


/**
 *  获取支付前的POST参数
 *
 *  @return 返回支付前的POST参数
 */
- (NSDictionary *)getParameter{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:self.themeListViewModel.guid forKey:@"houseWeekGuid"];
    NSString *buyNum = [NSString stringWithFormat:@"%lu",(long)self.payContentScrollView.purchaseQuantityView.purchaseQuantityStepper.value];
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
        totalPriceLabel.textColor = [UIColor redColor];
        
        NSString *totalPriceString = [NSString stringWithFormat:@"应付金额：%f",self.totalPrice];
        totalPriceLabel.text = totalPriceString;
        [self.view addSubview:totalPriceLabel];
        _totalPriceLabel = totalPriceLabel;
    }
    return _totalPriceLabel;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.payContentScrollView setValueWith:self.themeListViewModel];
}


- (void)setTotalPrice:(double)totalPrice{
    _totalPrice = totalPrice;
    NSString *totalPriceString = [NSString stringWithFormat:@"金额：%0.2f",totalPrice];
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
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = PartnerID;
    NSString *seller = SellerID;
    NSString *privateKey = PartnerPrivKey;
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertController *acController = [UIAlertController alertControllerWithTitle:@"提示" message:@"缺少partner或者seller或者私钥" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [acController addAction:defaultAction];
        [self presentViewController:acController animated:YES completion:^{
            
        }];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.productName = @"漫庭测试产品"; //商品标题
    order.productDescription = @"漫庭测试产品描述信息"; //商品描述
    order.amount = @"0.01"; //商品价格
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"mantingv";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }

//    NSDictionary *parameter = [self getParameter];
//    NSString *url = [BASE_URL stringByAppendingString:@"/order/before_pay"];
//    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSString *result = [dic objectForKey:@"result"];
//        //失败则返回
//        if ([result isEqualToString:@"ERROR"]) {
//            NSLog(@"错误");
//            return ;
//        }
//        
//        //成功则发起支付
//        if ([result isEqualToString:@"SUCCESS"]) {
//            NSString *oderGuid = [dic objectForKey:@"data"];
//            
//            NSString *urlWithOutOderGuid = [BASE_URL stringByAppendingString:@"/order/alipay/"];
//            NSString *url = [urlWithOutOderGuid stringByAppendingString:oderGuid];
//            NSLog(@"%@",url);
//            [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//                
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                NSLog(@"————————————》支付结果:%@",dic);
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                
//            }];
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}

#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
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
