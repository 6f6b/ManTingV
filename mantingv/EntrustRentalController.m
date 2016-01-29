//
//  EntrustRentalController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/5.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "EntrustRentalController.h"

@interface EntrustRentalController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *rentalPriceLabel;
@property (weak, nonatomic) IBOutlet UITextField *rentalNumberOfDaysLabel;

@property (weak, nonatomic) IBOutlet UITextField *remarkLabel;
@property (nonatomic,strong) NSMutableDictionary *parameters;
@end

@implementation EntrustRentalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"委托出租";
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.000];
    
    self.rentalPriceLabel.delegate = self;
    self.rentalNumberOfDaysLabel.delegate = self;
    self.remarkLabel.delegate = self;

    // Do any additional setup after loading the view from its nib.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.rentalPriceLabel resignFirstResponder];
    [self.rentalNumberOfDaysLabel resignFirstResponder];
    [self.remarkLabel resignFirstResponder];
    return YES;
}

- (IBAction)commitButton:(id)sender {
    NSLog(@"点击提交");
    //度假屋Guid
    [self.parameters setValue:self.myHouseGuid forKey:@" myHouseGuid "];
    
    //租出价格
    [self.parameters setValue:self.rentalPriceLabel.text forKey:@"price"];
    
    //出租天数
    [self.parameters setValue:self.rentalNumberOfDaysLabel.text forKey:@"days"];
    
    //备注
    [self.parameters setValue:self.remarkLabel.text forKey:@"description"];
    
    NSString *url = [BASE_URL stringByAppendingString:@"/rent/torent"];
    [self.manager POST:url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSString *result = [dic objectForKey:@"result"];
        if([result isEqualToString:@"SUCCESS"]){
            [KVNProgress showSuccessWithStatus:@"申请托管成功！"];
        }
        if ([result isEqualToString:@"ERROR"]) {
            [KVNProgress showErrorWithStatus:@"申请托管失败"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [KVNProgress showErrorWithStatus:@"申请托管失败"];
    }];
}

- (NSMutableDictionary *)parameters{
    if (nil == _parameters) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        _parameters = dic;
    }
    return _parameters;
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
