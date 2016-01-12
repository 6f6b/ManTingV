//
//  ChooserView.m
//  test
//
//  Created by LiuFeng on 15/12/14.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ChooserView.h"
#define TABLEVIEW_HEIGHT 130
#define BUTTON_HEIGHT 40
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
typedef void(^ChooseBlock)(NSInteger indexOfDataAndButtons,NSIndexPath *indexPath);

@interface ChooserView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy) ChooseBlock chooseBlock;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,assign) NSInteger indexOfDataAndButton;
@end
@implementation ChooserView

#pragma mark - 选择器对象的创建与配置
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.indexOfDataAndButton = 0;
        self.backgroundColor = [UIColor colorWithRed:1.000 green:0.989 blue:0.916 alpha:1.000];
    }
    return self;
}

+ (instancetype)shareChooserViewWith:(CGPoint)origin{
    CGRect frame;
    frame.origin = origin;
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = BUTTON_HEIGHT;
    ChooserView *chooserView = [[ChooserView alloc] initWithFrame:frame];
    
    //目的
    NSDictionary *dicDestination1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicDestination2 = @{@"name":@"SANYA",@"label":@"三亚"};
    NSDictionary *dicDestination3 = @{@"name":@"LIJIANG",@"label":@"丽江"};
    NSDictionary *dicDestination4 = @{@"name":@"XISHUANGBANNA",@"label":@"西双版纳"};
    NSDictionary *dicDestination5 = @{@"name":@"SHENZHEN",@"label":@"深圳"};
    NSDictionary *dicDestination6 = @{@"name":@"GUANGZHOU",@"label":@"广州"};
    NSDictionary *dicDestination7 = @{@"name":@"CHENGDU",@"label":@"成都"};
    NSDictionary *dicDestination8 = @{@"name":@"SUZHOU",@"label":@"苏州"};
    NSDictionary *dicDestination9 = @{@"name":@"KUNMING",@"label":@"昆明"};

    //主题
    NSDictionary *dicTheme1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicTheme2 = @{@"name":@"GAOERFU",@"label":@"高尔夫"};
    NSDictionary *dicTheme3 = @{@"name":@"SHATAN",@"label":@"沙滩"};
    NSDictionary *dicTheme4 = @{@"name":@"HUJING",@"label":@"湖景"};
    NSDictionary *dicTheme5 = @{@"name":@"XUESHAN",@"label":@"雪山"};
    NSDictionary *dicTheme6 = @{@"name":@"GUZHEN",@"label":@"古镇"};
    NSDictionary *dicTheme7 = @{@"name":@"BIHAN",@"label":@"避寒"};
    NSDictionary *dicTheme8 = @{@"name":@"BISHU",@"label":@"避暑"};
    NSDictionary *dicTheme9 = @{@"name":@"WENQUAN",@"label":@"温泉"};
    
    //价格
    NSDictionary *dicPrice1 = @{@"name":@"NOT_LIMIT",@"label":@"不限"};
    NSDictionary *dicPrice2 = @{@"name":@"ZERO_TO_FIVE",@"label":@"5万以下"};
    NSDictionary *dicPrice3 = @{@"name":@"FIVE_TO_TEN",@"label":@"5-10万"};
    NSDictionary *dicPrice4 = @{@"name":@"TEN_TO_FIFTEEN",@"label":@"10-15万"};
    NSDictionary *dicPrice5 = @{@"name":@"FIFTEEN_TO_TWENTY",@"label":@"15-20万"};

    NSArray *chooserViewData = @[
  @[dicDestination1,dicDestination2,dicDestination3,dicDestination4,dicDestination5,dicDestination6,dicDestination7,dicDestination8,dicDestination9],
  @[dicTheme1,dicTheme2,dicTheme3,dicTheme4,dicTheme5,dicTheme6,dicTheme7,dicTheme8,dicTheme9],
  @[dicPrice1,dicPrice2,dicPrice3,dicPrice4,dicPrice5]];
    
    [chooserView setDataArraysWith:chooserViewData];
    return chooserView;
}

- (void)setTitlesOfButtonWith:(NSArray *)titles{
    for (int i=0; i<titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        CGFloat X = SCREEN_WIDTH/3*i;
        CGFloat Y = 0;
        CGFloat W = SCREEN_WIDTH/3;
        CGFloat H = 40;
        button.frame = CGRectMake(X, Y, W, H);
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [self addSubview:button];
    }
}

- (void)setDataArraysWith:(NSArray *)dataContentArray{
    [self setDataContentArray:dataContentArray];
}

//button的点击事件
- (void)dealBtn:(UIButton *)button{
    self.indexOfDataAndButton = button.tag;
    [self showTableView];
}

//创建tableView
- (UITableView *)tableView{
    if (nil == _tableView) {
        CGFloat X = 0;
        CGFloat Y = BUTTON_HEIGHT;
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = TABLEVIEW_HEIGHT;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(X, Y, W, H) style:UITableViewStylePlain];
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor greenColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.hidden = YES;
        [self addSubview:tableView];
        
    }
    return _tableView;
}

- (void)setClickedAction:(void (^)(NSInteger index, NSIndexPath *indexPath))action{
    self.chooseBlock = action;
}
#pragma mark - tableview代理方法的实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.dataContentArray[self.indexOfDataAndButton];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *dic = self.dataContentArray[self.indexOfDataAndButton][indexPath.row];
    NSString *title = [dic objectForKey:@"label"];
    if (nil == title) {
        title = [dic objectForKey:@"title"];
    }
    cell.textLabel.text = title;
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self hiddenTableView];
    if (self.chooseBlock) {
        self.chooseBlock(self.indexOfDataAndButton,indexPath);
    }
}

#pragma mark - 自定义方法用于显示和隐藏tableview

//隐藏TableView
- (void)hiddenTableView{
    self.tableView.hidden = YES;
    CGRect frame = self.frame;
    frame.size.height = 40;
    self.frame = frame;
}

//显示刷新TableView
- (void)showTableView{
    self.tableView.hidden = NO;
    CGRect frame = self.frame;
    frame.size.height = 170;
    self.frame = frame;
    [self.superview bringSubviewToFront:self];
    [self.tableView reloadData];
}
@end
