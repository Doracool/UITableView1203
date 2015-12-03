//
//  QYTableViewCell.m
//  02-团购作业XIB
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTableViewCell.h"

@implementation QYTableViewCell

-(void)setModel:(QYModel *)model
{
    _model = model;
    
    _title.text = model.title;
    _icon.text = model.price;
    _people.text = model.buycount;
    _imgView.image = [UIImage imageNamed:model.icon];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
