//
//  PopViewController.m
//  OMUI
//
//  Created by Omichael on 2017/4/10.
//  Copyright © 2017年 康美. All rights reserved.
//
#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
#pragma mark -------------------------------------------------------------------------------------------------ConfigureUI------------------------------------------------------------
#import "PopViewController.h"
#import "FDAlertView.h"
#import "SheetActionView.h"
#import "TanKuangView.h"
#import "PickTimeView.h"
#import "OMPopoverController.h"
#import "WYPopoverController.h"
#import "UIPickerViewController.h"
#import "OMPickerViewVC.h"
@interface PopViewController ()<UITableViewDelegate,UITableViewDataSource,FDAlertViewDelegate,WYPopoverControllerDelegate>
{
    WYPopoverController* popoverController;
}
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) SheetActionView *sheetView;
@property (nonatomic, strong) TanKuangView  *tan;
@property (nonatomic, strong) PickTimeView  *pickView;
@end

@implementation PopViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 45;
    self.tableView.pagingEnabled = YES;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    self.titleArray = [NSMutableArray array];
    self.titleArray = @[@"FDAlertView",@"SheetActionView",@"TanKuangView",@"PickTimeView",@"UIPickerView",@"WYPopoverController",@"OMPickerViewVC",@"",@"",@"",@"",@"",@"",@""];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark -------------------------------------------------------------------------------------------------DataSource、Delegate------------------------------------------------------------
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        [self configureFDAlertView]; //FDAlertView
    }
    if (indexPath.row == 1) {
        
        [self configureSheetView];  //SheetView
    }
    if (indexPath.row == 2) {
        
        [self configureTanKuangView];//TanKuangView 右上方的弹框，
    }
    if (indexPath.row == 3) {
       
        [self configurePickTimeView];//UIDatePicker

    }
    if (indexPath.row == 4) {
                                     //UIPicker
        UIPickerViewController *vc = [[UIPickerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 5) {
                                      //WYPopoverViewController
        [self configureWYPopoverViewController];

    }
    if (indexPath.row == 6) {
        
        OMPickerViewVC *vc = [[OMPickerViewVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark -------------------------------------------------------------------------------------------------ConfigureFDAlertView、FDAlertViewDelegate------------------------------------------------------------
- (void)configureFDAlertView
{
    FDAlertView *alertView = [[FDAlertView alloc] initWithTitle:@"提示" icon:nil message:[NSString stringWithFormat:@"是否拨打电话%@",@"400800234"] delegate:self buttonTitles:@"取消",@"确定", nil];
    [alertView setTitleColor:DeepColor fontSize:14];
    [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:0];
    [alertView setButtonTitleColor:BackgroundColor fontSize:14 atIndex:1];
    [alertView show];

}

- (void)alertView:(FDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0) {
        
    }
    if (buttonIndex == 1) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"400800234"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}
#pragma mark -------------------------------------------------------------------------------------------------ConfigureSheetView------------------------------------------------------------

- (void)configureSheetView
{
    if (!self.sheetView)
    {
        self.sheetView = [SheetActionView new];
        self.sheetView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight);
        [self.view addSubview:_sheetView];
        
    }
    
    [self.sheetView animationPresent];
    
    __weak SheetActionView *safeView = self.sheetView;
    [safeView setSheetViewBlock:^(NSInteger sheet) {
        
        if (sheet == 100) {
            
        }
        else if (sheet == 101)
        {
            
        }
        else if (sheet == 102)
        {
        }
        [safeView animationedDismiss];
        
    }];

}
#pragma mark -------------------------------------------------------------------------------------------------ConfigureTanKuangView------------------------------------------------------------

- (void)configureTanKuangView
{
    if (!self.tan)
    {
        self.tan = [[TanKuangView alloc] init];
        self.tan.navigation = self.navigationController;
        self.tan.frame = CGRectMake(0, -CoreHeight, CoreWidth, CoreHeight);
        [self.view addSubview:_tan];
        
    }
    [self.tan animationPresent];

}
#pragma mark -------------------------------------------------------------------------------------------------ConfigurePickTimeView------------------------------------------------------------

- (void)configurePickTimeView
{
    if (!self.pickView)
    {
        self.pickView = [PickTimeView new];
        self.pickView.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight);
        [self.view addSubview:_pickView];
        
    }
    
    [self.pickView animationPresent];
}

#pragma mark -------------------------------------------------------------------------------------------------ConfigureUIPickerView------------------------------------------------------------

- (void)configureUIPickerView
{
    
}


#pragma mark -------------------------------------------------------------------------------------------------configureWYPopoverViewController------------------------------------------------------------

- (void)configureWYPopoverViewController
{
    if (popoverController == nil)
    {
        
        OMPopoverController *settingsViewController = [[OMPopoverController alloc] init];
        popoverController = [[WYPopoverController alloc] initWithContentViewController:settingsViewController];
        popoverController.delegate = self;
        popoverController.popoverLayoutMargins = UIEdgeInsetsMake((CoreHeight - 300)/2, 10, (CoreHeight - 300)/2, 10);
        popoverController.wantsDefaultContentAppearance = NO;
        
        [popoverController presentPopoverAsDialogAnimated:YES
                                                  options:WYPopoverAnimationOptionFadeWithScale];
        
        [settingsViewController setDismissBlock:^(OMPopoverController *om){
            
            [popoverController dismissPopoverAnimated:YES completion:^{
                
                [self  popoverControllerShouldDismissPopover:popoverController];
                
            }];
            
        }];
        
        
        [settingsViewController setSureButtonBlock:^(OMPopoverController *om){
            
            [popoverController dismissPopoverAnimated:YES completion:^{
                
                [self  popoverControllerShouldDismissPopover:popoverController];
                
            }];
            
        }];
    }
    
    
}
#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller
{
    NSLog(@"popoverControllerDidPresentPopover");
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    if (controller == popoverController)
    {
        popoverController.delegate = nil;
        popoverController = nil;
    }
    return YES;
}

@end
