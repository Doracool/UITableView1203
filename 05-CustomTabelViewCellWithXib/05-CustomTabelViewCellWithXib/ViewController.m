//
//  ViewController.m
//  05-CustomTabelViewCellWithXib
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *QYID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = @[@{@"title":@"zhangsan",@"subTitle":@"高富帅",@"imageName":@"icon0.jpg",@"isOn":@1},
               @{@"title":@"lisi",@"subTitle":@"屌丝",@"imageName":@"icon1.jpg",@"isOn":@0},
               @{@"title":@"wangwu",@"subTitle":@"白富美",@"imageName":@"icon2.jpg",@"isOn":@1},
               @{@"title":@"zhaoliu",@"subTitle":@"极品女士",@"imageName":@"icon3.jpg",@"isOn":@0},
               @{@"title":@"tianqi",@"subTitle":@"码农",@"imageName":@"icon4.jpg",@"isOn":@0},
               @{@"title":@"songba",@"subTitle":@"大神",@"imageName":@"icon5.jpg",@"isOn":@1}];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.rowHeight = 100;
    
    //注册单元格
    [tableView registerNib:[UINib nibWithNibName:@"QYTableViewCell" bundle:nil] forCellReuseIdentifier:QYID];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITabelViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#if 0
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil][0];
        }
#else
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID forIndexPath:indexPath];
#endif
    NSDictionary *dict = _datas[indexPath.row];
    
    cell.titleLabel.text = dict[@"title"];
    cell.detailTitleLabel.text = dict[@"subTitle"];
    cell.sw.on = [dict[@"isOn"] boolValue];
    cell.imgView.image = [UIImage imageNamed:dict[@"imageName"]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
