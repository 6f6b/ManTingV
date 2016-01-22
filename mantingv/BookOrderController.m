
//
//  BookOrderController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "BookOrderController.h"

@interface BookOrderController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *advancePaymentLabel;
@property (weak, nonatomic) IBOutlet UILabel *earnestMoneyLabel;

@property (weak, nonatomic) IBOutlet UITextField *reservationPerson;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;

@property (weak, nonatomic) IBOutlet UITextField *leaveWord;
@end

@implementation BookOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reservationPerson.delegate = self;
    self.phoneNum.delegate = self;
    self.leaveWord.delegate = self;
    self.advancePaymentLabel.text = [NSString stringWithFormat:@"预付价：￥%@",self.earnestMoney];
    self.earnestMoneyLabel.text = [NSString stringWithFormat:@"%@",self.earnestMoney];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)commitButton:(id)sender {
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    
    [parameter setValue:self.rentGuid forKey:@"rentGuid"];
    [parameter setValue:self.reservationPerson.text forKey:@"username"];
    [parameter setValue:self.phoneNum.text forKey:@"phoneNum"];
    [parameter setValue:self.leaveWord.text forKey:@"message"];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *userGuid = [user objectForKey:USER_GUID];
    [parameter setValue:userGuid forKey:@"userGuid"];
    
    NSString *url = [BASE_URL stringByAppendingString:@"/rent/pay"];
    NSLog(@"%@",parameter);
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"---->%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.reservationPerson resignFirstResponder];
    [self.phoneNum resignFirstResponder];
    [self.leaveWord resignFirstResponder];
    return YES;
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
