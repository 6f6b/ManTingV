//
//  MTPayContentScrollView.h
//  mantingv
//
//  Created by LiuFeng on 15/12/15.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "MTBaseScrollView.h"
#import "PurchaseQuantityView.h"
#import "AddressContentView.h"

@interface MTPayContentScrollView : MTBaseScrollView
@property (nonatomic,weak) PurchaseQuantityView *purchaseQuantityView;
@property (nonatomic,weak) AddressContentView *addressContentView;
@end
