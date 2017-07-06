//
//  UITableViewVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//
#define CustomCellID @"UITableViewCellID"
#import "UITableViewVC.h"
#import "UILabelVC.h"
#import "UITextFieldVC.h"
#import "UIButtonVC.h"
#import "UIImageViewVC.h"
#import "UIViewVC.h"
#import "UISegmentedControlVC.h"
#import "UISliderVC.h"
#import "UIStepperVC.h"
#import "UIProgressViewVC.h"
#import "UISwitchVC.h"
@interface UITableViewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) UIView        *headerView;
@property (nonatomic, strong) UIImageView   *addImageView;
@property (nonatomic, strong) UILabel       *addLabel;

@end

@implementation UITableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    
    _array = @[@"UILabel",@"UITextField",@"UIButton",@"UIImageView",@"UIView",@"UISegmentedControl",@"UISlider",@"UIStepper",@"UIProgressView",@"UISwitch",@"",@"",@""];
   
}
#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CustomCellID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UILabelVC *vc = [UILabelVC new];
        [self.navigationController pushViewController:vc animated:YES];

    }
    else if (indexPath.row == 1)
    {
        UITextFieldVC *vc = [UITextFieldVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        UIButtonVC *vc = [UIButtonVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3)
    {
        UIImageViewVC  *vc = [UIImageViewVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        UIViewVC *vc = [UIViewVC new];
        [self.navigationController pushViewController:vc animated:YES];
  
    }
    else if (indexPath.row == 5)
    {
        UISegmentedControlVC *vc = [UISegmentedControlVC new];
        [self.navigationController pushViewController:vc animated:YES];

        
    }
    else if (indexPath.row == 6)
    {
        UISliderVC *vc = [UISliderVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (indexPath.row == 7)
    {
        UIStepperVC *vc = [UIStepperVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 8)
    {
        UIProgressViewVC *vc = [UIProgressViewVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 9)
    {
        UISwitchVC *vc = [UISwitchVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }

}

-(UITableView *)tableView {
    
    
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = BASE_BACKGROUND_COLOR;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 55;
        //_tableView.tableHeaderView = self.headerView;  //表头
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CustomCellID];
        
        
    }
    return _tableView;
}
- (UIView *)headerView
{
    
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.layer.borderWidth = 0.5;
        _headerView.layer.borderColor = KHexColor(@"#ebebeb").CGColor;
        _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH,60);
        [_headerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)]];
    }
    return _headerView;
}

- (UIImageView *)addImageView
{
    if (!_addImageView) {
        
        
        _addImageView = [UIImageView new];
        _addImageView.image = [UIImage imageNamed:@"icon-tthy"];
        
    }
    return _addImageView;
}
- (UILabel *)addLabel
{
    if (!_addLabel) {
        
        _addLabel = [UILabel new];
        _addLabel.font = [UIFont systemFontOfSize:14];
        _addLabel.textColor = KHexColor(@"#999999");
        
    }
    
    return _addLabel;
}
- (void)tapClick
{
    
}

@end
