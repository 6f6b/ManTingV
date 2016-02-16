//
//  GuidController.m
//  mantingv
//
//  Created by LiuFeng on 16/2/16.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "GuidController.h"
#import "MTTabBarController.h"
#define SCREEN_FRAME [UIScreen mainScreen].bounds.origin

@interface GuidController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *guidContentScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation GuidController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.guidContentScrollView.delegate = self;
    self.pageControl.numberOfPages = 3;
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_FRAME.x, SCREEN_FRAME.y, SCREEN_WIDTH, SCREEN_HEIGHT)];
    image1.backgroundColor = [UIColor redColor];
    image1.image = [UIImage imageNamed:@"100"];
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, SCREEN_FRAME.y, SCREEN_WIDTH, SCREEN_HEIGHT)];
    image2.image = [UIImage imageNamed:@"101"];
    
    UIView *lastView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, SCREEN_FRAME.y, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    image3.image = [UIImage imageNamed:@"102"];
    [lastView addSubview:image3];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"进入漫庭" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(dealBtn) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(SCREEN_WIDTH/2-40, SCREEN_HEIGHT-40, 80, 30);
    [lastView addSubview:button];
    
    [self.guidContentScrollView addSubview:image1];
    [self.guidContentScrollView addSubview:image2];
    [self.guidContentScrollView addSubview:lastView];

    self.guidContentScrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastView.frame), 0);
    self.guidContentScrollView.pagingEnabled = YES;
//    self.guidContentScrollView.n
    // Do any additional setup after loading the view from its nib.
}

- (void)dealBtn{
    NSLog(@"进入漫庭");
    MTTabBarController *tbc = [[MTTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tbc;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    self.pageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
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
