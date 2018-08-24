//
//  OMMeViewController.m
//  OMUI
//
//  Created by MichaeOu on 2018/4/4.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "OMMeViewController.h"
#import "OMMeTableViewCell.h"
static NSString *identifier = @"identifierCell";
@interface OMMeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation OMMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self datasourceFor];
    [self.view addSubview:self.tableView];
}
- (void)datasourceFor
{
    
    _datasource = [NSMutableArray arrayWithObjects:
                   @[
                     @{@"title":@"个人资料",@"image":@"person_grzl"},
                     @{@"title":@"就诊人管理",@"image":@"personCenter_Health_archives"},
                     @{@"title":@"我的收藏",@"image":@"personCenter_collect"},
                     @{@"title":@"会员中心",@"image":@"personCenter_collect"},
                     //@{@"title":@"我的优惠码",@"image":@"personCenter_yhm"},
                     ],
                   @[
                     @{@"title":@"防癌筛查订单",@"image":@"icon_fatj"},
                     @{@"title":@"药品订单",@"image":@"icon-wdcfd"},
                     @{@"title":@"我的收货地址",@"image":@"icon-wdshd"},
                     ],
                   
                   @[
                     //@{@"title":@"咨询医生订单",@"image":@"personCenter_zixun"},
                     @{@"title":@"医生工作室订单",@"image":@"personCenter_jydd"},
                     @{@"title":@"物流订单",@"image":@"personCenter_logistics"},
                     @{@"title":@"服务记录",@"image":@"personCenter_Service_record"},
                     ],
                   @[
                     @{@"title":@"设置",@"image":@"personCenter_setting"},
                     @{@"title":@"客服电话",@"image":@"personCenter_phone"},
                     ]
                    , nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *sectionArray = _datasource[section];
    return sectionArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 10 : 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _datasource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OMMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[OMMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSArray *sectionArray = _datasource[indexPath.section];
        
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",[sectionArray[indexPath.row] valueForKey:@"title"]];
        cell.iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[sectionArray[indexPath.row] valueForKey:@"image"]]];
    }
    return cell;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 50;
        _tableView.separatorColor = KHexColor(@"#e6e6e6");
    }
    return _tableView;
}
@end
