//
//  QYTableViewCell.h
//  01-团购作业StoryBoard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYModel;
@interface QYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pay;
@property (weak, nonatomic) IBOutlet UILabel *people;

@property (nonatomic,strong) QYModel *model;
@end
