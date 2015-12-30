//
//  ThemeListContentScrollView.m
//  mantingv
//
//  Created by LiuFeng on 15/12/25.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "ThemeListContentScrollView.h"
#import "LFLoopScrollViewForMT.h"
#import "ThemeListContentView.h"
#import "ThemeListContentScrollViewModel.h"
#import "ResortFacilitiesView.h"

@interface ThemeListContentScrollView ()<SeclectionViewDelegate>
//@property (nonatomic,weak) LFLoopScrollViewForMT *themeListPictuerScrollView;
@property (nonatomic,weak) ThemeListContentView *themListContentView;
@property (nonatomic,weak) LFSelectionView *selectView;
@end

@implementation ThemeListContentScrollView

//- (LFLoopScrollViewForMT *)themeListPictuerScrollView{
//    if (nil == _themeListPictuerScrollView) {
//        LFLoopScrollViewForMT *themeListPictuerScrollView = [LFLoopScrollViewForMT loopScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
//        
//        themeListPictuerScrollView.autoScroll = YES;
//        themeListPictuerScrollView.backgroundColor = [UIColor greenColor];
//        _themeListPictuerScrollView = themeListPictuerScrollView;
//        [self addSubview:_themeListPictuerScrollView];
//    }
//    return _themeListPictuerScrollView;
//}


//主题列表视图
- (ThemeListContentView *)themListContentView{
    if (nil == _themListContentView) {
        ThemeListContentView *themeListContentView = [[ThemeListContentView alloc] init];
        themeListContentView.frame = CGRectMake(0, CGRectGetMaxY(self.loopScrollView.frame), 0, 0);
        themeListContentView.controller = self.controller;
        themeListContentView.backgroundColor = [UIColor orangeColor];
        [self addSubview:themeListContentView];
        _themListContentView = themeListContentView;
    }
    return _themListContentView;
}

- (LFSelectionView *)selectView{
    if (nil == _selectView) {
        LFSelectionView *selectView = [LFSelectionView selectionViewWithOrigin:CGPointMake(0, CGRectGetMaxY(self.themListContentView.frame))];
        selectView.backgroundColor = [UIColor whiteColor];
        selectView.delegate = self;
        [self addSubview:selectView];
        _selectView = selectView;
    }
    return _selectView;
}

- (void)selectView:(UIView *)selectView{
    self.contentSize = CGSizeMake(0, CGRectGetMaxY(selectView.frame));
}

- (void)setValueWith:(id)data{
    if(!data){
        return;
    }
    ThemeListContentScrollViewModel *model = [ThemeListContentScrollViewModel modelWithDictionary:data];
    
//////////////////////////////////////为滚动视图赋值////////////////////////////////////////////////////////////////////////////
    [self.loopScrollView setImageWithUrlS:model.imageGuids];
//////////////////////////////////////为themeListContentView赋值////////////////////////////////////////////////////////////////////////////
    [self.themListContentView setValueWith:model];
    
//////////////////////////////////////为SelectView赋值////////////////////////////////////////////////////////////////////////////
    [self.selectView setTitlesWith:@[@"度假屋介绍",@"基本信息",@"度假屋设施"]];
    /***********度假屋介绍View***************/
    UILabel *holidayHomeIntroductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    holidayHomeIntroductionLabel.text = model.houseFeature;
    holidayHomeIntroductionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    holidayHomeIntroductionLabel.numberOfLines = 0;
    holidayHomeIntroductionLabel.font = [UIFont systemFontOfSize:15];
    
    //动态调节label的高度
    NSDictionary *attribute1 = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGSize size1 = [holidayHomeIntroductionLabel.text boundingRectWithSize:holidayHomeIntroductionLabel.frame.size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute1 context:nil].size;
    CGRect frame1 = holidayHomeIntroductionLabel.frame;
    frame1.size.height = size1.height;
    holidayHomeIntroductionLabel.frame = frame1;
    
    UILabel *baseMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    baseMessageLabel.text = model.houseType;
    baseMessageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    baseMessageLabel.numberOfLines = 0;
    baseMessageLabel.font = [UIFont systemFontOfSize:15];
    //动态调节label的高度
    NSDictionary *attribute2 = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGSize size2 = [baseMessageLabel.text boundingRectWithSize:baseMessageLabel.frame.size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute2 context:nil].size;
    CGRect frame2 = baseMessageLabel.frame;
    frame2.size.height = size2.height;
    baseMessageLabel.frame = frame2;
    
    ResortFacilitiesView *resortFacilitiesView = [[ResortFacilitiesView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:model.equipmentDTOs];
    for (int i=0; i<model.supportingDTOs.count; i++) {
        [arr addObject:model.supportingDTOs[i]];
    }
    [resortFacilitiesView setValueWith:arr];
    
    NSArray *views = @[holidayHomeIntroductionLabel,baseMessageLabel,resortFacilitiesView];
    [self.selectView setViewWith:views];
    
}
@end
