//
//  CellAnimationVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/9/21.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "CellAnimationVC.h"
#import "BaseTableViewController.h"

@interface CellAnimationVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CellAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _titles = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    [self.view addSubview:self.tableView];
    
}
#pragma mark  - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseTableViewController *vc = [[BaseTableViewController alloc] init];
    vc.index = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (_titles.count > indexPath.row) {
        cell.textLabel.text = _titles[indexPath.row];
    }
    
    return cell;
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)toTableViewVC {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

