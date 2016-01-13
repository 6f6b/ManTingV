//
//  ContentScrollViewForExchangeOrTransfer.h
//  mantingv
//
//  Created by LiuFeng on 16/1/13.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "ContentScrollViewWithChooserView.h"

@interface ContentScrollViewForExchangeOrTransfer : ContentScrollViewWithChooserView
@property (nonatomic,copy) NSString *appendingUrl;
- (void)loadDataFromServer;
@end
