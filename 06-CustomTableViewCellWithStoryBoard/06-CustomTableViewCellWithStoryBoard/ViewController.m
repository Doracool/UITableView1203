//
//  ViewController.m
//  06-CustomTableViewCellWithStoryBoard
//
//  Created by qingyun on 15/12/3.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYModel.h"
#import "QYTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *QYID = @"cell";
-(NSArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"datas" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dict in array) {
            QYModel *model = [QYModel modelWithDict:dict];
            [models addObject:model];
        }
        _datas = models;
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QYID forIndexPath:indexPath];
    
    
    QYModel *model = self.datas[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
