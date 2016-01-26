//
//  ThemeListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListController.h"
#import "ThemeListContentScrollView.h"

@interface ThemeListController ()
@property (nonatomic,weak) ThemeListContentScrollView *themeListContentScrollView;
@end

@implementation ThemeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.themeListContentScrollView setValueWith:Nil];
    [self loadDataFromServer];
    
}


- (void)loadDataFromServer{
    NSString *string = [NSString stringWithFormat:@"/house/house_info/details/%@",self.guid];
    NSString *url = [BASE_URL stringByAppendingString:string];
    NSLog(@"---->%@",url);
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.themeListContentScrollView setValueWith:[dic objectForKey:@"data"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (ThemeListContentScrollView *)themeListContentScrollView{
    if (nil == _themeListContentScrollView) {
        ThemeListContentScrollView *themeListContentScrollView = [[ThemeListContentScrollView alloc] initWithFrame:self.view.bounds];
        themeListContentScrollView.controller = self;
        themeListContentScrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:themeListContentScrollView];
        _themeListContentScrollView = themeListContentScrollView;
    }
    return _themeListContentScrollView;
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
