//
//  CustomCollectionsVC.m
//  OMUI
//
//  Created by Omichael on 2017/4/7.
//  Copyright © 2017年 康美. All rights reserved.
//
static NSString *identifier = @"CustomCollectionViewCellID";

#import "CustomCollectionsVC.h"
#import "CustomCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface CustomCollectionsVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UITableView                   *tableView;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView              *collectionView;

@end

@implementation CustomCollectionsVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"东阿新城百货";
    self.view.backgroundColor = [UIColor whiteColor];
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake((CoreWidth)/2, 150);
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    [self.layout setHeaderReferenceSize:CGSizeMake(CoreWidth, 50)];
    [self.layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
}
#pragma mark ------------------------------------------------------------------UICollectionViewDelegateFlowLayout-------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    __weak CustomCollectionViewCell*safeCell = cell;
    [safeCell setPushBlock:^() {
        
       
    }];
    return cell;
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCollectionReusableView*headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.headerViewImage.image = [UIImage imageNamed:@"iconImage"];
    headerView.headerViewImage.backgroundColor = [UIColor redColor];
    headerView.frame = CGRectMake(0, 0, CoreWidth, 200);
    return headerView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //        OrderDetailViewController *vc = [OrderDetailViewController  new];
    //        self.hidesBottomBarWhenPushed = YES;
    //        [self.navigationController pushViewController:vc animated:YES];
}
@end
