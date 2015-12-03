//
//  ViewController.m
//  02-团购作业XIB
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYModel.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *tgs;
@end

@implementation ViewController
static NSString *QYID = @"cell";

-(NSArray *)tgs
{
    if (_tgs == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            QYModel *model = [QYModel modelWithDict:dict];
            [models addObject:model];
        }
        _tgs = models;
    }
    return _tgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 150;
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:self options:nil][0];
    }
    
    QYModel *model= self.tgs[indexPath.row];
    
    cell.model = model;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
