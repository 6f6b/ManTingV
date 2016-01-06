//
//  AddressListCell.m
//  mantingv
//
//  Created by LiuFeng on 16/1/6.
//  Copyright © 2016年 LiuFeng. All rights reserved.
//

#import "AddressListCell.h"
#import "AddressDTOModel.h"

@interface AddressListCell ()
@property (weak, nonatomic) IBOutlet UILabel *contactPersonLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@end
@implementation AddressListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValueWith:(id)data{
    AddressDTOModel *model = [AddressDTOModel modelWithDictionary:data];
    self.contactPersonLabel.text = model.username;
    self.phoneNumLabel.text = [NSString stringWithFormat:@"联系电话：%@",model.phoneNum];
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@%@%@",model.province,model.city,model.district,model.area];
}

@end
