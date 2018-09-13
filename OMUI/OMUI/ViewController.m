//
//  ViewController.m
//  OMUI
//
//  Created by Omichael on 2017/3/30.
//  Copyright © 2017年 康美. All rights reserved.
//

#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------ConfigureUI------------------------------------------------------------

static NSString *identifier = @"ViewCollectionCell";
#import "ViewController.h"
#import "ViewCollectionCell.h"
/*
 所有控件
 */
#import "UserInterfaceVC.h"
#import "DetailUIVC.h"


/*
 UITableViews
 */
#import "MyViewController.h" //我的Cell
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
 导航栏
 */

/*
 手势
 */
#import "GestureVC.h"

@interface ViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *array;
    NSArray *array1;
    NSArray *array2;
    NSArray *array3;
    NSArray *array4;
    NSArray *array5;

}
// <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) NSArray *titleArray ;
@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    //[self.layout setHeaderReferenceSize:CGSizeMake(CoreWidth, 500)];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[ViewCollectionCell class] forCellWithReuseIdentifier:identifier];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderViewOM"];
    
   
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType"];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType1"];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType2"];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType3"];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType4"];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerSelectType5"];



    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
    
    self.titleArray = [NSMutableArray array];
    array = [NSArray arrayWithObjects:@"所有控件",@"所有控件详情",@"",@"",@"", nil];
    array1 = [NSArray arrayWithObjects:@"自定义Cell",@"横向滑动的UITableView",@"",@"",@"", nil];
    array2 = [NSArray arrayWithObjects:@"渐变",@"左右切换UIScroll",@"",@"",@"", nil];
    array3 = [NSArray arrayWithObjects:@"水平的UICollectionViews",@"自定义Collections 有表头",@"",@"",@"", nil];
    array4 = [NSArray arrayWithObjects:@"弹框集合",@" ",@"",@"",@"", nil];
    array5 = [NSArray arrayWithObjects:@"手势",@" ",@"",@"",@"", nil];


}

//头部试图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(CoreWidth, 40);
}
//头部和脚部的加载
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *ID = nil;
    if (indexPath.section == 0) {
        ID = @"headerSelectType";
    }
    else if(indexPath.section == 1)
    {
        ID = @"headerSelectType1";
    }
    else if(indexPath.section == 2)
    {
        ID = @"headerSelectType2";
    }
    else if(indexPath.section == 3)
    {
        ID = @"headerSelectType3";
    }
    else if(indexPath.section == 4)
    {
        ID = @"headerSelectType4";
    }
    else if(indexPath.section == 5)
    {
        ID = @"headerSelectType5";
    }

    
    HeaderCollectionReusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ID forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label.text=@"所有控件";
            label.textColor = [UIColor redColor];
            [view addSubview:label];
            
        }
        if (indexPath.section == 1) {
            UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label1.textColor = [UIColor redColor];
            label1.text=@"UITableViews";
            [view addSubview:label1];
            
        }
        if (indexPath.section == 2) {
            UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label2.textColor = [UIColor redColor];
            label2.text=@"UIScrollView";
            [view addSubview:label2];
            
        }
        
        if (indexPath.section == 3) {
            UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label3.textColor = [UIColor redColor];
            label3.text=@"UICollectionViews";
            [view addSubview:label3];
        }
        
        if (indexPath.section == 4) {
            UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label4.textColor = [UIColor redColor];
            label4.text=@"弹框";
            [view addSubview:label4];
        }
        if (indexPath.section == 5) {
            UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 20)];
            label5.text=@"手势";
            label5.textColor = [UIColor redColor];
            [view addSubview:label5];

        }

        
    }else{
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 20)];
        
        label.text=@"脚";
    }
    return view;
    
}
//一共有多少个组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}
//每一组有多少个cell
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return array.count;
    }
    else if(section == 1)
    {
        return array1.count;
    }
    else if(section == 2)
    {
        return array2.count;
    }
    else if(section == 3)
    {
        return array3.count;
    }
    else if(section == 4)
    {
        return array4.count;
    }
    else if(section == 5)
    {
        return array5.count;
    }

    else
    {
        return 0;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ViewCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.label.text=[NSString stringWithFormat:@"%ld",indexPath.section*100+indexPath.row];
    if (indexPath.section == 0) {

             cell.label.text = array[indexPath.row];
    }
    else if(indexPath.section == 1)
    {
      
        cell.label.text = array1[indexPath.row];

    }
    else if(indexPath.section == 2)
    {
             cell.label.text = array2[indexPath.row];
    }
    else if(indexPath.section == 3)
    {
              cell.label.text = array3[indexPath.row];
    }
    else if(indexPath.section == 4)
    {
        cell.label.text = array4[indexPath.row];
    }
    else if(indexPath.section == 5)
    {
        cell.label.text = array5[indexPath.row];
    }
    return cell;
}
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(115, 100);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
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
