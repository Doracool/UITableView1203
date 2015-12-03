//
//  QYTableViewCell.h
//  02-团购作业XIB
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYModel.h"
@interface QYTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *icon;
@property (weak, nonatomic) IBOutlet UILabel *people;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic,strong) QYModel *model;
@end
