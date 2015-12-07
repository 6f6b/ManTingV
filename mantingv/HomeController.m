//
//  HomeController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/3.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "HomeController.h"
#import "ContentScrollView.h"

@interface HomeController ()
@property (weak,nonatomic) ContentScrollView* contentScrollView;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    ContentScrollView *contentScrollView = [[ContentScrollView alloc] initWithFrame:self.view.bounds];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    self.contentScrollView = contentScrollView;
    [self.view addSubview:contentScrollView];
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
