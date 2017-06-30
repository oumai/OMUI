//
//  TianZiGeTableView.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/29.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "CircleListVC.h"
#import "TianZiGeModel.h"
#import "CircleCustomCell.h"
@interface CircleListVC ()<UITableViewDataSource,UITableViewDelegate>
{
    CircleCustomCell *cell;
}

@property (nonatomic , strong)NSMutableArray    *requestDataArray;
@property (nonatomic, strong) NSMutableArray    *dataArray;
@property (nonatomic, strong) NSMutableArray    *keysArray;


@property (nonatomic, strong) NSMutableArray    *pregnancyArray;
@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) UIView            *sectionView;
@property (nonatomic, strong) UILabel           *diJiLabel;
@end

@implementation CircleListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"历史饮食";
    self.dataArray = [NSMutableArray array];
    self.keysArray = [NSMutableArray array];
    self.requestDataArray = [NSMutableArray array];
    
    self.pregnancyArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 100;
    self.tableView.backgroundColor = KHexColor(@"#ebebeb");
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    
}
#pragma mark ------------------------------------------------------------------Actions  ButtonClick-----------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierHD = @"HistoryDietCustomCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifierHD];
    if (nil == cell) {
        cell = [[CircleCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierHD];
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
