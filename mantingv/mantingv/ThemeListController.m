//
//  ThemeListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListController.h"
#import "ThemeListContentView.h"
#import "SelectView.h"

@interface ThemeListController ()<SeclectViewDelegate>
@property (nonatomic,weak) UIScrollView *contentScrollView;
@property (nonatomic,weak) LFLoopScrollView *themeListPictuerScrollView;
@property (nonatomic,weak) ThemeListContentView *themListContentView;
@property (nonatomic,weak) SelectView *selectView;
@end

@implementation ThemeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentScrollView.frame = self.view.bounds;
    
    NSArray *urls = @[@"http://down.tutu001.com/d/file/20101129/2f5ca0f1c9b6d02ea87df74fcc_560.jpg",@"http://pica.nipic.com/2008-03-19/2008319183523380_2.jpg",@"http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg"];
    [self.themeListPictuerScrollView setImageWithUrlS:urls];
    
    [self.themListContentView setValueWithModel:nil];
    
    [self.selectView setValue];
    self.selectView.delegate = self;
    
    //子控件加载完毕后，刷新contentScrollView的contentSize属性
    self.contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.selectView.frame));
}


- (UIScrollView *)contentScrollView{
    if (nil == _contentScrollView) {
        UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        contentScrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:contentScrollView];
        _contentScrollView = contentScrollView;
    }
    return _contentScrollView;
}

- (LFLoopScrollView *)themeListPictuerScrollView{
    if (nil == _themeListPictuerScrollView) {
        LFLoopScrollView *themeListPictuerScrollView = [LFLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];

        themeListPictuerScrollView.autoScroll = YES;
        themeListPictuerScrollView.backgroundColor = [UIColor greenColor];
        _themeListPictuerScrollView = themeListPictuerScrollView;
        [self.contentScrollView addSubview:_themeListPictuerScrollView];
    }
    return _themeListPictuerScrollView;
}

//主题列表视图
- (ThemeListContentView *)themListContentView{
    if (nil == _themListContentView) {
        ThemeListContentView *themeListContentView = [[ThemeListContentView alloc] init];
        themeListContentView.frame = CGRectMake(0, CGRectGetMaxY(self.themeListPictuerScrollView.frame), 0, 0);
        themeListContentView.backgroundColor = [UIColor orangeColor];
        [self.contentScrollView addSubview:themeListContentView];
        _themListContentView = themeListContentView;
    }
    return _themListContentView;
}

- (SelectView *)selectView{
    if (nil == _selectView) {
        SelectView *selectView = [[SelectView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.themListContentView.frame), ScreenWidth, 0)];
        selectView.backgroundColor = [UIColor greenColor];
        [self.contentScrollView addSubview:selectView];
        _selectView = selectView;
    }
    return _selectView;
}

- (void)selectView:(UIView *)selectView{
    NSLog(@"%@",NSStringFromCGRect(selectView.frame));
    self.contentScrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(selectView.frame));
    NSLog(@"%@",NSStringFromCGSize(self.contentScrollView.contentSize));
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
