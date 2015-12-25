//
//  SelectView.m
//  test
//
//  Created by LiuFeng on 15/12/11.
//  Copyright © 2015年 LiuFeng. All rights reserved.
//

#import "SelectView.h"
#import "ResortFacilitiesView.h"

@interface SelectView ()
@property (nonatomic,weak) UILabel *holidayHomeTextView;
@property (nonatomic,weak) UILabel *essentialInformationTextView;
@property (nonatomic,weak) ResortFacilitiesView *resortFacilitiesView;
@property (nonatomic,strong) NSMutableArray *buttons;
@end
@implementation SelectView


- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.buttons = [[NSMutableArray alloc] init];
    [self createButton];
}

//创建三个按钮
- (void)createButton{
    NSArray *titles = @[@"度假屋介绍",@"基本信息",@"度假屋设施"];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.buttons addObject:button];
        [button setBackgroundColor:[UIColor redColor]];
        [self addSubview:button];
        
        button.tag = 100+i;
        float X = 101*i;
        float Y = 0;
        float W = 100;
        float H = 40;
        button.frame = CGRectMake(X, Y, W, H);
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor grayColor]];
        [button addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchDown];
        
    }
}

//赋值
- (void)setValue{
    self.holidayHomeTextView.text = @"fsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfkdfmngkldfmnk";
    //动态调节label的高度
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    CGSize size = [self.holidayHomeTextView.text boundingRectWithSize:self.holidayHomeTextView.frame.size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    CGRect frame = self.holidayHomeTextView.frame;
    frame.size.height = size.height;
    self.holidayHomeTextView.frame = frame;
    
    
    self.essentialInformationTextView.text = @"lkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjdslkagjdlkjglkdjklgjdlksjgfkljdlgkjdkfkdfmngkldfmnkfsjlkgfjd";
    attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    size = [self.essentialInformationTextView.text boundingRectWithSize:self.essentialInformationTextView.frame.size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    frame = self.holidayHomeTextView.frame;
    frame.size.height = size.height;
    self.essentialInformationTextView.frame = frame;

    //他自己在内部调节大小
    [self.resortFacilitiesView setValueWith:nil];
    
    //赋值过后先选中第一个button
    UIButton *button = self.buttons[0];
    [self dealBtn:button];
}

#pragma mark - 创建下方的子控件
- (UILabel *)holidayHomeTextView{
    if (nil == _holidayHomeTextView) {
        UILabel *holidayHomeTextView = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width, 0)];
        holidayHomeTextView.font = [UIFont systemFontOfSize:13];
        holidayHomeTextView.numberOfLines = 0;
        holidayHomeTextView.lineBreakMode = NSLineBreakByWordWrapping;
        holidayHomeTextView.backgroundColor = [UIColor greenColor];
        [self addSubview:holidayHomeTextView];
        _holidayHomeTextView = holidayHomeTextView;
    }
    return _holidayHomeTextView;
}

- (UILabel *)essentialInformationTextView{
    if (nil == _essentialInformationTextView) {
        UILabel *essentialInformationTextView = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width, 0)];
        essentialInformationTextView.font = [UIFont systemFontOfSize:13];
        essentialInformationTextView.backgroundColor = [UIColor blueColor];
        essentialInformationTextView.numberOfLines = 0;
        essentialInformationTextView.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:essentialInformationTextView];
        _essentialInformationTextView = essentialInformationTextView;
    }
    return _essentialInformationTextView;
}


- (ResortFacilitiesView *)resortFacilitiesView{
    if (nil == _resortFacilitiesView) {
        ResortFacilitiesView *resortFacilitiesView = [[ResortFacilitiesView alloc] initWithFrame:CGRectMake(0, 40, self.frame.size.width, 0)];
        [self addSubview:resortFacilitiesView];
        _resortFacilitiesView = resortFacilitiesView;
    }
    return _resortFacilitiesView;
}

- (void)dealBtn:(UIButton *)button{
    //当被点击时，把全部都隐藏
    self.holidayHomeTextView.hidden = YES;
    self.resortFacilitiesView.hidden = YES;
    self.essentialInformationTextView.hidden = YES;
    
    //然后看选中哪一个则显示哪一个，并根据该选中子视图大小调节父视图大小
    CGRect frame = self.frame;
    if (100 == button.tag) {
        self.holidayHomeTextView.hidden = NO;
        frame.size.height = CGRectGetMaxY(self.holidayHomeTextView.frame);
    }
    
    if (101 == button.tag) {
        self.essentialInformationTextView.hidden = NO;
        frame.size.height = CGRectGetMaxY(self.essentialInformationTextView.frame);
    }
    
    if (102 == button.tag) {
        self.resortFacilitiesView.hidden = NO;
        frame.size.height = CGRectGetMaxY(self.resortFacilitiesView.frame);
    }
    self.frame = frame;
    
    for (int i=0; i<self.buttons.count; i++) {
        UIButton *button = self.buttons[i];
        button.selected = NO;
    }
    button.selected = YES;

    //让代理调节自身的大小
    if (!self.delegate) {
        return;
    }
    [self.delegate selectView:self];
}
@end
