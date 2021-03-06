//
//  LinkageViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/9.
//  Copyright © 2017年 康美. All rights reserved.
//

#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------ConfigureUI------------------------------------------------------------


#define  LeftTableViewWidth 150
#define  LeftTableViewHeight self.view.frame.size.height
#define  RightTableViewWidth (self.view.frame.size.width - LeftTableViewWidth)


#import "LinkageViewController.h"


/*
 ①
 所有控件
 */
#import "UserInterfaceVC.h"  //所有控件
#import "DetailUIVC.h"       //所有控件详情
#import "LazyInitVC.h"       //懒加载创建
#import "CalendarViewController.h"//日历
#import "UITableViewVC.h"    //懒加载单独创建
#import "NavigationViewController.h"//导航栏
/*
 ②
 UITableViews
 */
#import "MyViewController.h"    //我的Cell
#import "HorizonalTableViewVC.h"//水平滑动的UITableView
#import "LinkageVC.h"           //联动效果
#import "SettingViewController.h"//设置界面
#import "OMMeViewController.h"   //个人中心
#import "TianZiGeTableViewVC.h"  //田字格界面
#import "CircleListVC.h"        //圈圈
 /*
 ③
 UIScrollView
 */
#import "GradientVC.h"
#import "ChangeViewScrollVC.h"// 左右滑动切换 UIScorll


/*
 ④
 UICollectionViews
 */
#import "HorizonalCollectionViewVC.h" //水平的滑动
#import "CustomCollectionsVC.h"       //自定义Collection有表头
#import "HeaderCollectionReusableView.h"

/*
 ⑤
 弹框
 */
#import "PopViewController.h"
#import "TanKuangView.h"
#import "SheetActionView.h"
#import "FDAlertView.h"
#import "WYPopoverController.h"
#import "UIAlertControllerVC.h"

/*
 ⑥
 手势
 */
#import "GestureVC.h"


/*
 ⑦
 渐变
 */
#import "GradientViewController.h"


/*
 ⑧
 其他
 */
#import "RadiusViewController.h"

#import "CircleLinesViewController.h"
#import "ResizableImageVC.h"

/*
 ⑨
 动画
 */
#import "CellAnimationVC.h"
#import "NumberAnimationVCViewController.h" //数字动画

@interface LinkageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_rightTableView;
    UITableView *_leftTableView;
    NSArray *_leftTableSource;
    NSArray *_rightTableSource;
    NSArray *_proTimeList;
    NSArray *_proTitleList;
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
                         @"渐变",
                         @"其他",
                         @"动画"
                         ];
    
    
    _rightTableSource = @[@{@"header":@"所有控件",
                            @"title":@[@"UserInterfaceVC",@"DetailUIVC",@"LazyInitVC",@"每个控件",@"导航栏",@"日历"]},
                          
                          @{@"header":@"UITableViews",
                            @"title":@[@"MyViewController",@"水平滑动的UITableView",@"LinkageVC",@"个人中心(李赛强)",@"个人中心(健康BAT)",@"田字格",@"CircleListVC"]},
                          
                          @{@"header":@"UIScrollView",
                            @"title":@[@"GradientVC",@"ChangeViewScrollVC",@"jj",@"xx",@"yy",@"zz"]},
                          
                          @{@"header":@"UICollectionViews",
                            @"title":@[@"水平的滑动",@"自定义Collection有表头",@"cc",@"dd",@"ee",@"ff"]},
                          
                          @{@"header":@"弹框",
                            @"title":@[@"PopViewController",@"TanKuangView",@"SheetActionView",@"FDAlertView",@"WYPopoverController",@"OMPickerViewVC",@"UIAlertControllerVC"]},
                          
                          @{@"header":@"手势",
                            @"title":@[@"GestureVC",@"ss",@"jj",@"xx",@"yy",@"zz"]},
                          
                          @{@"header":@"渐变",
                            @"title":@[@"GradientViewController",@"ss",@"jj",@"xx",@"yy",@"zz"]},
                          
                          @{@"header":@"其他",
                            @"title":@[@"RdiusViewController",@"图片拉伸",@"多线条组成的圆圈",@"xx",@"yy",@"zz"]},
                          
                          @{@"header":@"动画",
                            @"title":@[@"cell动画",@"数字动画"]}
                          
                          ];
    
    
    
    [self setupSomeParamars];
    
    
        
  }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_rightTableView == tableView) {
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
            else if (indexPath.row == 2)
            {
                LazyInitVC *bas = [LazyInitVC new];
                [self.navigationController pushViewController:bas animated:YES];
            }
            else if (indexPath.row == 3)
            {
                UITableViewVC *vc = [UITableViewVC new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 4)
            {
                NavigationViewController *bas = [NavigationViewController new];
                [self.navigationController pushViewController:bas animated:YES];
            }
            else if (indexPath.row == 5)
            {
                CalendarViewController *bas = [CalendarViewController new];
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
            if (indexPath.row == 2) {
                //联动效果
                LinkageVC *vc = [LinkageVC new];
                [self.navigationController pushViewController:vc animated:YES];

            }
          
            else if (indexPath.row == 3)
            {
                //设置界面
                SettingViewController *vc = [SettingViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 4)
            {
                OMMeViewController *vc = [OMMeViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if (indexPath.row == 5)
            {
                TianZiGeTableViewVC *vc = [TianZiGeTableViewVC new];
                [self.navigationController pushViewController:vc animated:YES];
                

            }
            else if (indexPath.row == 6)
            {
                CircleListVC *vc = [CircleListVC new];
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
        /*渐变*/
        
        else if (indexPath.section == 6)
        {
            
            GradientViewController *gra = [GradientViewController new];
            [self.navigationController pushViewController:gra animated:YES];

        }
        /*其他*/
        else if (indexPath.section == 7)
        {

            if (indexPath.row == 0) {
                RadiusViewController *gra = [RadiusViewController new];
                [self.navigationController pushViewController:gra animated:YES];
            }
            else if (indexPath.row == 1) {
                
                
                ResizableImageVC *gra = [ResizableImageVC new];
                [self.navigationController pushViewController:gra animated:YES];
            
            }
            else if (indexPath.row == 2) {
                CircleLinesViewController *gra = [CircleLinesViewController new];
                [self.navigationController pushViewController:gra animated:YES];
            }
        }
        /*动画*/
        else if (indexPath.section == 8)
        {
            //cell动画
            if (indexPath.row == 0) {
                CellAnimationVC *gra = [CellAnimationVC new];
                [self.navigationController pushViewController:gra animated:YES];
            }
            
            if (indexPath.row == 1) {
                NumberAnimationVCViewController *vc = [[NumberAnimationVCViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }

    }
    else
    {
        //计算出右侧tableView将要滚动的位置
        NSIndexPath *moveToIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        //将右侧tableView移动到指定位置
        [_rightTableView selectRowAtIndexPath:moveToIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        //取消选中效果
        [_rightTableView deselectRowAtIndexPath:moveToIndexPath animated:YES];
        
    }
   
}
//创建两个tableview
- (void)setupSomeParamars
{
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(LeftTableViewWidth, 0, RightTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
    [self.view addSubview:_rightTableView];
    
    
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 15, LeftTableViewWidth, self.view.frame.size.height) style:UITableViewStyleGrouped];
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

/*
 联动效果在于这里
 这个方法不准确
 */
//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    if(tableView == _rightTableView){
//        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
//    }
//}


//MARK: - 一个方法就能搞定 右边滑动时跟左边的联动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 如果是 左侧的 tableView 直接return
    if (scrollView == _leftTableView) return;
    
    // 取出显示在 视图 且最靠上 的 cell 的 indexPath
    NSIndexPath *topHeaderViewIndexpath = [[_rightTableView indexPathsForVisibleRows] firstObject];
    
    // 左侧 talbelView 移动的 indexPath
    NSIndexPath *moveToIndexpath = [NSIndexPath indexPathForRow:topHeaderViewIndexpath.section inSection:0];
    
    // 移动 左侧 tableView 到 指定 indexPath 居中显示
    [_leftTableView selectRowAtIndexPath:moveToIndexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

@end
