//
//  MyShortRentListController.m
//  mantingv
//
//  Created by LiuFeng on 15/12/17.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MyShortRentListController.h"
#import "MTSwitchView.h"
#import "RentListDTOModel.h"
#import "MyRentListCell.h"

#import "UMSocialSnsService.h"
#import "UMSocial.h"
@interface MyShortRentListController ()<UITableViewDataSource,UITableViewDelegate,UMSocialDataDelegate>
@property (nonatomic,weak) MTSwitchView *switchView;
@property (nonatomic,copy) NSString *appendingUrl;
@end

@implementation MyShortRentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的短租";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Share_20.16690647482px_1183447_easyicon.net"] style:UIBarButtonItemStyleDone target:self action:@selector(dealRightItem)];
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
//    [self.navigationItem.rightBarButtonItem backgroundImageForState:UIControlStateNormal barMetrics:uibar];
    self.navigationItem.rightBarButtonItem = rightItem;
//    UIImageView *imagev = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7"]];
//    self.navigationItem.titleView = imagev;
    
    NSArray *urls = @[@"/my_house/rent_list_lessee/",@"/my_house/rent_list_hirer/"];
    self.appendingUrl = urls[0];

    
    NSArray *titles = @[@"正常",@"失效"];
    MTSwitchView *switchView = [MTSwitchView switchViewWithTitles:titles];
    [switchView setClickedAction:^(NSInteger index) {
        self.appendingUrl = urls[index-1000];
        [self loadDataFromServer];
    }];
    _switchView = switchView;
    [self.view addSubview:switchView];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.switchView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(self.switchView.frame));
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyRentListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyRentListCell class])];
    
    [self loadDataFromServer];
    // Do any additional setup after loading the view.
}

- (void)dealRightItem{
//    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7"], 0.2);
    
    /*================================UM默认分享UI界面==========================================*/
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.yoka.com/dna/pics/Star/ba15ae1c/1/d357517b7931d15177.jpg"];
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.mantingv.com";
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"张学友漫庭之家演唱会";

    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.mantingv.com";
    [UMSocialData defaultData].extConfig.wechatFavoriteData.url = @"http://www.mantingv.com";
    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://www.mantingv.com";
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://www.mantingv.com";

    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56975b9467e58e3593001c47"
                                      shareText:@"慢下来，享你所想"
                                     shareImage:nil
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,UMShareToQQ,UMShareToSms,UMShareToSina,UMShareToQzone,UMShareToEmail]
                                       delegate:nil];
    
    /*================================自定义之微信系列分享==========================================*/
////    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.baidu.com";
////    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
//    NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"6e99cf785f741d8b840ed49bd5cd3df7"]);
//    
//    //使用UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite分别代表微信好友、微信朋友圈、微信收藏
//    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToSina] content:@"分享内嵌文字" image:imageData location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
//        if (response.responseCode == UMSResponseCodeSuccess) {
//            NSLog(@"分享成功！");
//        }
//    }];
//    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.baidu.com";
//    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
}


- (void)loadDataFromServer{
    NSString *urlWithOutUserGuid = [BASE_URL stringByAppendingString:self.appendingUrl];
    NSString *url = [urlWithOutUserGuid stringByAppendingString:[MTTools userGuid]];
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        self.dataArray = arr;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 实现tableView代理事件
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RentListDTOModel *rentListDTOModel = [RentListDTOModel modelWithDictionary:self.dataArray[indexPath.row]];
    MyRentListCell *myRentListCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyRentListCell class])];
    [myRentListCell.backImage lfSetImageWithURL:rentListDTOModel.houseImageGuid[0]];
    myRentListCell.titleLab.text = rentListDTOModel.houseName;
    myRentListCell.priceLabel.text = [NSString stringWithFormat:@"价格：%@",rentListDTOModel.price];
    return myRentListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
