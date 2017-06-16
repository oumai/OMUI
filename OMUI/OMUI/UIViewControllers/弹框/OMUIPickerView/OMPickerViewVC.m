//
//  OMPickerViewVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/15.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "OMPickerViewVC.h"

@interface OMPickerViewVC ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) NSArray *proTimeList;
@end

@implementation OMPickerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureUIPickerView];
}
- (void)configureUIPickerView
{
    //√数据源要在UIPicker的前面
    _proTimeList = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];

    // 选择框
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    // 显示选中框
    pickerView.showsSelectionIndicator=YES;
    pickerView.backgroundColor = [UIColor redColor];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [pickerView selectRow:9 inComponent:0 animated:NO];
    [self.view addSubview:pickerView];
    

    [self pickerView:pickerView didSelectRow:9 inComponent:0];
}

#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [_proTimeList count];
   
}
#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString  *_proTimeStr = [_proTimeList objectAtIndex:row];
    NSLog(@"_proTimeStr=%@",_proTimeStr);
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_proTimeList objectAtIndex:row];
}

@end
