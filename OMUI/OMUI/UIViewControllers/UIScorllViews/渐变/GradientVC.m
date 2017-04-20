//
//  GradientVC.m
//  OMUI
//
//  Created by Omichael on 2017/4/7.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "GradientVC.h"

@interface GradientVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation GradientVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alphaValue = (_tableView.contentOffset.y+64)/100;
    NSLog(@" alphaValue = %f",alphaValue);
    self.navigationController.navigationBar.alpha = 1 - alphaValue;
    
    
}
@end
