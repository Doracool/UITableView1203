//
//  QYModel.h
//  01-团购作业StoryBoard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYModel : NSObject
@property (nonatomic,strong) NSString *buycount;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
