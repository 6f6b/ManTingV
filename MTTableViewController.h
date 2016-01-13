//
//  MTTableViewController.h
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "MTController.h"

@interface MTTableViewController : MTController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,weak) UITableView *tableView;
@end
