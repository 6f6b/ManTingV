//
//  AddAddressController.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddAddressController.h"
#import "AddAddressContentScrollView.h"

@interface AddAddressController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,weak) AddAddressContentScrollView *addAddressContentScrollView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,weak) UIPickerView *pickerView;

@property (nonatomic,weak) UITextField *nameEditTextFiled;
@property (nonatomic,weak) UITextField *phoneNumEditTextFiled;
@property (nonatomic,weak) UIButton *provinceEdityButton;
@property (nonatomic,weak) UIButton *cityEdityButton;
@property (nonatomic,weak) UIButton *countyEdityButton;

@property (nonatomic,weak) UIButton *finishButton;
@end

@implementation AddAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.addAddressContentScrollView setValueWith:nil];
    
    self.nameEditTextFiled = self.addAddressContentScrollView.contactPersonEditView.nameEditView.rightTextFiled;
    self.phoneNumEditTextFiled = self.addAddressContentScrollView.contactPersonEditView.phoneNumEditView.rightTextFiled;

    self.provinceEdityButton = self.addAddressContentScrollView.contactAddressEditView.proviceEditView.rightButton;
    self.cityEdityButton = self.addAddressContentScrollView.contactAddressEditView.cityEditView.rightButton;
    self.countyEdityButton = self.addAddressContentScrollView.contactAddressEditView.countyEditView.rightButton;
    
    
    [self.provinceEdityButton addTarget:self action:@selector(loadProvincesFromServer) forControlEvents:UIControlEventTouchUpInside];
    [self.cityEdityButton addTarget:self action:@selector(loadCitysFromServer) forControlEvents:UIControlEventTouchUpInside];
    [self.countyEdityButton addTarget:self action:@selector(loadAreasFromServer) forControlEvents:UIControlEventTouchUpInside];
}

- (UIPickerView *)pickerView{
    if (nil == _pickerView) {
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200)];
        pickerView.backgroundColor = [UIColor colorWithRed:0.962 green:0.879 blue:1.000 alpha:1.000];
        [self.view addSubview:pickerView];
        _pickerView = pickerView;
        pickerView.dataSource = self;
        pickerView.delegate = self;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"完成" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [button addTarget:self action:@selector(dealBtn) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(SCREEN_WIDTH-40, SCREEN_HEIGHT-200-30, 40, 30);
        _finishButton = button;
        [self.view addSubview:button];
    }
    return _pickerView;
}

- (void)dealBtn{
    [self.pickerView removeFromSuperview];
    self.pickerView = nil;
    
    [self.finishButton removeFromSuperview];
    self.finishButton = nil;
}

- (AddAddressContentScrollView *)addAddressContentScrollView{
    if (nil == _addAddressContentScrollView) {
        AddAddressContentScrollView *addAddressContentScrollView = [[AddAddressContentScrollView alloc] initWithFrame:self.view.bounds];
        addAddressContentScrollView.controller = self;
        [self.view addSubview:addAddressContentScrollView];
        _addAddressContentScrollView = addAddressContentScrollView;
    }
    return _addAddressContentScrollView;
}

/**
 *  加载省列表
 */
- (void)loadProvincesFromServer{
    self.pickerView.tag = 1000;
    [self.addAddressContentScrollView.contactAddressEditView.cityEditView setValueWith:nil];
    [self.addAddressContentScrollView.contactAddressEditView.countyEditView setValueWith:nil];
    NSString *url = [BASE_URL stringByAppendingString:@"/user/find_province"];
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.dataArray = arr;
        [self.pickerView reloadComponent:0];
        [self.pickerView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/**
 *  加载城市列表
 */
- (void)loadCitysFromServer{
    self.pickerView.tag = 1001;
    [self.addAddressContentScrollView.contactAddressEditView.countyEditView setValueWith:nil];
    if (nil == self.addAddressContentScrollView.contactAddressEditView.proviceEditView.Id) {
        [KVNProgress showErrorWithStatus:@"请选择省份"];
        return;
    }
    NSDictionary *parameter = @{@"provinceId":self.addAddressContentScrollView.contactAddressEditView.proviceEditView.Id};
    NSString *url = [BASE_URL stringByAppendingString:@"/user/find_city"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.dataArray = arr;
        [self.pickerView reloadComponent:0];
        [self.pickerView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

/**
 *  加载区县列表
 */
- (void)loadAreasFromServer{
    self.pickerView.tag = 1002;
    if (nil == self.addAddressContentScrollView.contactAddressEditView.cityEditView.Id) {
        [KVNProgress showErrorWithStatus:@"请选择城市"];
        return;
    }
    NSDictionary *parameter = @{@"cityId":self.addAddressContentScrollView.contactAddressEditView.cityEditView.Id};
    NSString *url = [BASE_URL stringByAppendingString:@"/user/find_district"];
    [self.manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.dataArray = arr;
        [self.pickerView reloadAllComponents];
        [self.pickerView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark - 实现代理方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%lu",row);
    if (1000 == pickerView.tag) {
        [self.addAddressContentScrollView.contactAddressEditView.proviceEditView setValueWith:self.dataArray[row]];
    }
    if (1001 == pickerView.tag) {
        [self.addAddressContentScrollView.contactAddressEditView.cityEditView setValueWith:self.dataArray[row]];
    }
    if (1002 == pickerView.tag) {
        [self.addAddressContentScrollView.contactAddressEditView.countyEditView setValueWith:self.dataArray[row]];
    }
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
    NSDictionary *dic = self.dataArray[row];
    if (nil != [dic objectForKey:@"provinceName"]) {
        title = [dic objectForKey:@"provinceName"];
    }
    if (nil != [dic objectForKey:@"cityName"]) {
        title = [dic objectForKey:@"cityName"];
    }
    if (nil != [dic objectForKey:@"districtName"]) {
        title = [dic objectForKey:@"districtName"];
    }
    return title;
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
