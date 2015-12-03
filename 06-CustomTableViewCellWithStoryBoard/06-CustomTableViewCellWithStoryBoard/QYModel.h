//
//  QYModel.h
//  06-CustomTableViewCellWithStoryBoard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYModel : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *sex;
@property(nonatomic,strong) NSString *icon;
@property(nonatomic) BOOL ison;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
