//
//  TianZiGeTableView.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/29.
//  Copyright © 2017年 康美. All rights reserved.
//

#define GeZiHeight CoreWidth*3/8/4
#define GeZiWidth  CoreWidth/8


#import "TianZiGeTableViewVC.h"
#import "BloodSugarRecordCustomCell.h"
@interface TianZiGeTableViewVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView    *tableView;


@end

@implementation TianZiGeTableViewVC


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"血糖记录";
    self.view.backgroundColor = KHexColor(@"#ffffff");
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = CoreWidth*3/4/8;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BloodSugarRecordCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[BloodSugarRecordCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    return cell;
}
@end
