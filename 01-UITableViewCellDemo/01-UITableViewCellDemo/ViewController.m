//
//  ViewController.m
//  01-UITableViewCellDemo
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *QYID = @"QYCell";
-(NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"1",@"2",@"3",@"4"];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //懒加载
    
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:QYID];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

//单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#if 1
    //冲重用队列去闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:QYID];
    }
#else
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID forIndexPath:indexPath];
#endif
    NSString *imageView = [NSString stringWithFormat:@"icon%ld.jpg",indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageView];
    
    cell.textLabel.text = self.datas[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-%ld",self.datas[indexPath.row],indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
