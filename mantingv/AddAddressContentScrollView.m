//
//  AddAddressContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddAddressContentScrollView.h"

@interface AddAddressContentScrollView ()<UITextFieldDelegate>
@end
@implementation AddAddressContentScrollView

- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.contactPersonEditView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150);
    self.contactAddressEditView.frame = CGRectMake(0, CGRectGetMaxY(self.contactPersonEditView.frame), SCREEN_WIDTH, 200);
    self.addressForDetailTextFiled.frame = CGRectMake(0, CGRectGetMaxY(self.contactAddressEditView.frame), SCREEN_WIDTH, 50);
    self.commitButton.frame = CGRectMake(10, CGRectGetMaxY(self.addressForDetailTextFiled.frame)+10, SCREEN_WIDTH-20, 40);
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(self.commitButton.frame));
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardDidChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFrame:) name:UIKeyboardDidShowNotification object:nil];
}

- (ContactPersonEditView *)contactPersonEditView{
    if (nil == _contactPersonEditView) {
        ContactPersonEditView *contactPersonEditView = [[ContactPersonEditView alloc] init];
        contactPersonEditView.nameEditView.rightTextFiled.delegate = self;
        contactPersonEditView.phoneNumEditView.rightTextFiled.delegate = self;
        contactPersonEditView.titleLabel.text = @"联系人";
        contactPersonEditView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.000];
        [self addSubview:contactPersonEditView];
        _contactPersonEditView = contactPersonEditView;
    }
    return _contactPersonEditView;
}


- (ContactAddressEditView *)contactAddressEditView{
    if (nil == _contactAddressEditView) {
        ContactAddressEditView *contactAddressEditView = [[ContactAddressEditView alloc] init];
        contactAddressEditView.titleLabel.text = @"联系地址";
        contactAddressEditView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.000];
        [self addSubview:contactAddressEditView];
        _contactAddressEditView = contactAddressEditView;
    }
    return _contactAddressEditView;
}

- (UITextField *)addressForDetailTextFiled{
    if (nil == _addressForDetailTextFiled) {
        UITextField *addressForDetailTextFiled = [[UITextField alloc] init];
        addressForDetailTextFiled.delegate = self;
        [self addSubview:addressForDetailTextFiled];
        _addressForDetailTextFiled = addressForDetailTextFiled;
        addressForDetailTextFiled.placeholder = @"请输入详细地址";
    }
    return _addressForDetailTextFiled;
}

- (UIButton *)commitButton{
    if (nil == _commitButton) {
        UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [commitButton setTitle:@"提交" forState:UIControlStateNormal];
        [commitButton addTarget:self action:@selector(commitAddressInformation) forControlEvents:UIControlEventTouchUpInside];
        commitButton.frame = CGRectMake(10, CGRectGetMaxY(self.addressForDetailTextFiled.frame)+10, SCREEN_WIDTH-20, 40);
        [commitButton setBackgroundColor:[UIColor orangeColor]];
        [self addSubview:commitButton];
        _commitButton = commitButton;
    }
    return _commitButton;
}

- (void)keyBoardWillChangeFrame:(NSNotification *)notif{
    NSLog(@"改变");

    NSDictionary *userInfo = notif.userInfo;
    double duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];


    CGFloat changeY = beginFrame.origin.y-endFrame.origin.y;
    [UIView animateWithDuration:duration animations:^{
        CGSize size = self.contentSize;
        size.height = size.height+changeY;
        self.contentSize = size;
    }];
}

- (void)commitAddressInformation{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    NSString *userGuid = [MTTools userGuid];
    
    [parameter setValue:userGuid forKey:@"userGuid"];
    [parameter setValue:self.contactPersonEditView.nameEditView.rightTextFiled.text forKey:@"username"];
    [parameter setValue:self.contactPersonEditView.phoneNumEditView.rightTextFiled.text forKey:@"phoneNum"];
    [parameter setValue:self.contactAddressEditView.proviceEditView.Id forKey:@"province"];
    [parameter setValue:self.contactAddressEditView.cityEditView.Id forKey:@"city"];
    [parameter setValue:self.contactAddressEditView.countyEditView.Id forKey:@"district"];
    [parameter setValue:self.addressForDetailTextFiled.text forKey:@"area"];
    
    NSString *url = [BASE_URL stringByAppendingString:@"/order/add_address"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.controller.navigationController popViewControllerAnimated:YES];
        NSLog(@"%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

/**
 *  textField代理事件
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.addressForDetailTextFiled resignFirstResponder];
    [self.contactPersonEditView.nameEditView.rightTextFiled resignFirstResponder];
    [self.contactPersonEditView.phoneNumEditView.rightTextFiled resignFirstResponder];
    return YES;
}
@end
