//
//  ExchangeDetailController.h
//  mantingv
//
//  Created by LiuFeng on 15/12/21.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTController.h"
#import "ExchangePoolDTOModel.h"

@interface ExchangeDetailController : MTController
@property (nonatomic,copy) NSString *myHouseGuid;
@property (nonatomic,copy) NSString *exchangePoolGuid;
@end
