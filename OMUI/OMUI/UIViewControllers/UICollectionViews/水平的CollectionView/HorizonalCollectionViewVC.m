//
//  HorizonalCollectionViewVC.m
//  OMUI
//
//  Created by Omichael on 2017/4/6.
//  Copyright © 2017年 康美. All rights reserved.
//
static NSString *identifier = @"HorizonalCollectionCell";

#import "HorizonalCollectionViewVC.h"
#import "HorizonalCollectionCell.h"
@interface HorizonalCollectionViewVC ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) UICollectionView          *collectionView;

@end

@implementation HorizonalCollectionViewVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.itemSize = CGSizeMake(CoreWidth, CoreHeight);
    [self.layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:_layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[HorizonalCollectionCell class] forCellWithReuseIdentifier:identifier];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:19  inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
#pragma mark - UICollectionViewDelegateFlowLayout
// 设置每个cell上下左右相距
// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.000000001;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.000000001;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HorizonalCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //cell.xueYaTitleLabel.text = titleArray[indexPath.item];
    return cell;
}
@end
