//
//  SettingViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/13.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"
#import "SettingModel.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *infoDic;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style: UITableViewStyleGrouped];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setRowHeight:45];
    [self.tableView setBackgroundColor:KHexColor(@"#eeeeee")];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    //适配
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(self.view);
    }];

}
- (void)configureData
{
    SettingModel *earningItem = [SettingModel new];
    earningItem.iconName = @"more_icon_profit";
    earningItem.title = @"我的收益";
    earningItem.line = YES;
    //earningItem.cls = [MoreEarningViewController class];//设置跳转的界面
    
    SettingModel *rulesItem = [SettingModel new];
    rulesItem.iconName = @"more_icon_rule";
    rulesItem.title = @"诊所规则";
    rulesItem.line = YES;
    rulesItem.cls = nil;//设置跳转的界面
    
    SettingModel *serviceItem = [SettingModel new];
    serviceItem.iconName = @"more_icon_approve";
    serviceItem.title = @"认证服务";
    serviceItem.line = NO;
    serviceItem.cls = nil;//设置跳转的界面
    
    SettingModel *replyItem = [SettingModel new];
    replyItem.iconName = @"more_icon_quick-reply";
    replyItem.title = @"快捷回复";
    replyItem.line = YES;
    replyItem.cls = nil;//设置跳转的界面
    
    SettingModel *doctorItem = [SettingModel new];
    doctorItem.iconName = @"more_icon_star-docter";
    doctorItem.title = @"明星医生";
    doctorItem.line = NO;
    doctorItem.cls = nil;//设置跳转的界面
    
    SettingModel *feedbackItem = [SettingModel new];
    feedbackItem.iconName = @"more_icon_feedback";
    feedbackItem.title = @"意见反馈";
    feedbackItem.line = YES;
    feedbackItem.cls = nil;//设置跳转的界面
    
    SettingModel *customerServiceItem = [SettingModel new];
    customerServiceItem.iconName = @"more_icon_customer";
    customerServiceItem.title = @"联系客服";
    customerServiceItem.line = NO;
    customerServiceItem.cls = nil;//设置跳转的界面
    
    SettingModel *aboutItem = [SettingModel new];
    aboutItem.iconName = @"more_icon_about";
    aboutItem.title = @"关于天使医生";
    aboutItem.line = NO;
    aboutItem.cls = nil;//设置跳转的界面
    
    self.infoDic = @{@"0" : @[earningItem , rulesItem , serviceItem],
                     @"1" : @[replyItem , doctorItem],
                     @"2" : @[feedbackItem , customerServiceItem],
                     @"3" : @[aboutItem]};
}

#pragma mark - UITableViewDelegate dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_infoDic count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionKey = [@(section) stringValue];
    NSArray *infoArr = [_infoDic objectForKey:sectionKey];
    return [infoArr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0 == section ? 10 : 15;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, section == 0 ? 10 : 15)];
    headView.backgroundColor = KHexColor(@"#eeeeee");
    return headView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth,0.1)];
    headView.backgroundColor = KHexColor(@"#eeeeee");
    return headView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseIdentifer = @"more_identifier_cell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    if(!cell){
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifer];
    }
    NSString *sectionKey = [@(indexPath.section) stringValue];
    NSArray *infoArr = _infoDic[sectionKey];
    cell.infoObj = infoArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSString *sectionKey = [@(indexPath.section) stringValue];
    //    NSArray *infoArr = _infoDic[sectionKey];
    //    ASsetingMainModel *infoObject = infoArr[indexPath.row];
    
    //    UIViewController *viewController = (UIViewController *)[infoObject.cls new];
    //    if ([viewController isKindOfClass:[MoreEarningViewController class]]) {
    //        [self.navigationController pushViewController:viewController animated:YES];
    //
    //    }
    
    
}
@end
