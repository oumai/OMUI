//
//  LinkageViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/9.
//  Copyright © 2017年 康美. All rights reserved.
//
#define  LeftTableViewWidth 150
#define  LeftTableViewHeight self.view.frame.size.height
#define  RightTableViewWidth (self.view.frame.size.width - LeftTableViewWidth)


#import "LinkageViewController.h"


/*
 所有控件
 */
#import "UserInterfaceVC.h"  //所有控件
#import "DetailUIVC.h"       //所有控件详情


/*
 UITableViews
 */
#import "MyViewController.h"    //我的Cell
#import "HorizonalTableViewVC.h"//水平滑动的UITableView


/*
 UIScrollView
 */
#import "GradientVC.h"
#import "ChangeViewScrollVC.h"// 左右滑动切换 UIScorll


/*
 UICollectionViews
 */
#import "HorizonalCollectionViewVC.h" //水平的滑动
#import "CustomCollectionsVC.h"       //自定义Collection有表头
#import "HeaderCollectionReusableView.h"

/*
 弹框
 */
#import "PopViewController.h"
#import "TanKuangView.h"
#import "SheetActionView.h"
#import "FDAlertView.h"
#import "WYPopoverController.h"


/*
 手势
 */
#import "GestureVC.h"

@interface LinkageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_rightTableView;
    UITableView *_leftTableView;
    NSArray *_leftTableSource;
    NSArray *_rightTableSource;
}
@end

@implementation LinkageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _leftTableSource = @[@"所有控件",
                         @"UITableViews",
                         @"UIScrollView",
                         @"UICollectionViews",
                         @"弹框",
                         @"手势",
                         ];
    
    
    _rightTableSource = @[@{@"header":@"所有控件",
                            @"title":@[@"UserInterfaceVC",@"DetailUIVC",@"cc",@"dd",@"ee",@"ff"]},
                          
                          @{@"header":@"UITableViews",
                            @"title":@[@"MyViewController",@"水平滑动的UITableView",@"nn",@"oo",@"pp",@"qq"]},
                          
                          @{@"header":@"UIScrollView",
                            @"title":@[@"GradientVC",@"ChangeViewScrollVC",@"jj",@"xx",@"yy",@"zz"]},
                          
                          @{@"header":@"UICollectionViews",
                            @"title":@[@"水平的滑动",@"自定义Collection有表头",@"cc",@"dd",@"ee",@"ff"]},
                          
                          @{@"header":@"弹框",
                            @"title":@[@"PopViewController",@"TanKuangView",@"SheetActionView",@"FDAlertView",@"WYPopoverController",@"qq"]},
                          
                          @{@"header":@"手势",
                            @"title":@[@"GestureVC",@"ss",@"jj",@"xx",@"yy",@"zz"]}];
    
    
    
    [self setupSomeParamars];
    
}
//创建两个tableview
- (void)setupSomeParamars
{
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(LeftTableViewWidth, 0, RightTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
    [self.view addSubview:_rightTableView];
    
    
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LeftTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    [self.view addSubview:_leftTableView];
    
}
//添加表头
- (void)configureHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,RightTableViewWidth, 60)];
    headerView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = headerView.frame;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"联动表";
    [headerView addSubview:titleLabel];
    _rightTableView.tableHeaderView = headerView;

}

//设置cell的显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifer];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifer];
    }
    if(tableView == _rightTableView){
        cell.textLabel.text = [_rightTableSource[indexPath.section] objectForKey:@"title"][indexPath.row];
    }else if (tableView == _leftTableView){
        cell.textLabel.text = _leftTableSource[indexPath.row];
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return 40;
    }else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return 0.001;
    }else
    {
        return 0.001;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _rightTableView) {
        return _rightTableSource.count;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTableView) {
        return _leftTableSource.count;
    }else{
        return [[_rightTableSource[section] objectForKey:@"title"] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == _rightTableView) {
        return [_rightTableSource[section] objectForKey:@"header"];
    }else{
        return nil;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(tableView == _rightTableView){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 40)];
        label.backgroundColor = [UIColor cyanColor];
        label.text = [_rightTableSource[section] objectForKey:@"header"];
        label.textColor = [UIColor redColor];
        return label;
    }else{
        return nil;
    }
}

//联动效果在于这里
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if(tableView == _rightTableView){
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*所有控件*/
    if (indexPath.section == 0) {
        if (indexPath.row == 0)
        {
            //所有控件
            UserInterfaceVC *bas = [UserInterfaceVC new];
            [self.navigationController pushViewController:bas animated:YES];
        }
        else if (indexPath.row == 1) {
            //所有控件详情"
            DetailUIVC *bas = [DetailUIVC new];
            [self.navigationController pushViewController:bas animated:YES];
        }
        
    }
    /*
     UITableViews
     */
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            //自定义Cell
            MyViewController *bas = [MyViewController new];
            [self.navigationController pushViewController:bas animated:YES];
        }
        if (indexPath.row == 1) {
            
            //横向滑动的UITableView
            HorizonalTableViewVC *vc = [HorizonalTableViewVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    /*
     UIScrollViews
     */
    
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            
            //渐变
            GradientVC *gra = [GradientVC new];
            [self.navigationController pushViewController:gra animated:YES];
        }
        if (indexPath.row == 1) {
            //左右切换UIScroll
            ChangeViewScrollVC *gra = [ChangeViewScrollVC new];
            [self.navigationController pushViewController:gra animated:YES];
        }
    }
    /*
     UICollectionViews
     */
    else if (indexPath.section == 3)
    {
        if (indexPath.row == 0) {
            //水平的UICollectionViews
            HorizonalCollectionViewVC *gra = [HorizonalCollectionViewVC new];
            [self.navigationController pushViewController:gra animated:YES];
        }
        if (indexPath.row ==  1) {
            //自定义Collections 有表头
            CustomCollectionsVC *gra = [CustomCollectionsVC new];
            [self.navigationController pushViewController:gra animated:YES];
        }
    }
    /*弹框*/
    else if (indexPath.section == 4)
    {
        PopViewController *gra = [PopViewController new];
        [self.navigationController pushViewController:gra animated:YES];
    }
    
    /*手势*/
    else if (indexPath.section == 5)
    {
        GestureVC *gra = [GestureVC new];
        [self.navigationController pushViewController:gra animated:YES];
    }

}
@end
