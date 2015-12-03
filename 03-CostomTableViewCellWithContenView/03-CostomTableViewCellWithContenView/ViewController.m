//
//  ViewController.m
//  03-CostomTableViewCellWithContenView
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *QYID = @"cell";
#define QYScreenW [UIScreen mainScreen].bounds.size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UItableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    //设置代理和数据源
    tableView.dataSource = self;
    tableView.delegate = self;
    
    _datas = @[@"zhangquandan",@"lixiaohua",@"zhaotiezhu",@"fushikang"];
    
    //设置行高
    tableView.rowHeight = 100;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource
//每组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:QYID];
        //添加主标题
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 40)];
        [cell.contentView addSubview:titleLabel];
        titleLabel.tag = 100;
        
        //添加副标题
        UILabel *subTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, titleLabel.frame.origin.y + titleLabel.frame.size.height , 200, 40)];
        [cell.contentView addSubview:subTitleLabel];
        subTitleLabel.tag = 101;
        //添加图标
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(QYScreenW - 80 - 10, 10, 80, 80)];
        [cell.contentView addSubview:imageView];
        imageView.tag = 102;
    }
    
    //主标题
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:100];
    titleLabel.text = _datas[indexPath.row];
    
    //副标题
    UILabel *subTitleLabel = (UILabel *)[cell.contentView viewWithTag:101];
    subTitleLabel.text = @"你追我，如果你追到我......";
    
    //图标
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:102];
    
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
