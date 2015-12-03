//
//  QYTableViewCell.m
//  01-团购作业StoryBoard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTableViewCell.h"
#import "QYModel.h"
@implementation QYTableViewCell

-(void)setModel:(QYModel *)model
{
    //自己完成的
    _model = model;
    
    //额外的
    _titleLabel.text = model.title;
    _pay.text = model.price;
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
