//
//  UIPickerViewController.m
//  OMUI
//
//  Created by Omichael on 2017/4/12.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIPickerViewController.h"


@interface UIPickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSDictionary *sourceDict;
@property (nonatomic, strong) NSString *rowTitleFirst;
@property (nonatomic, strong) NSString *rowTitleSecond;
@property (nonatomic, strong) NSString *rowTitleThird;

@property (nonatomic, strong) UITextField *textfield;

@end

@implementation UIPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.m
    self.view.backgroundColor = [UIColor whiteColor];
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    //    [self.view addSubview:pickerView];
    pickerView.backgroundColor = [UIColor orangeColor];
    NSLog(@"pickerView %@", pickerView);
    
    /*
     设置代理
     1 包括代理对象，及数据源代理对象
     2 实现代理方法的对象
     3 添加协议
     4 实现代理方法
     
     注意事项
     1、两种代理必须同时实现
     2、标题显示设置三选一，只设置其中一个方法即可
     2-1、- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
     2-2、- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
     2-3、- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
     */
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    // 设置数据源
    NSArray *meizhouArray = @[@"梅县", @"五华县", @"丰顺县", @"大埔县", @"蕉岭县", @"兴宁市", @"梅江区"];
    NSArray *guangzhouArray = @[@"天河区", @"白云区", @"荔湾区", @"番禺区", @"海珠区", @"花都区", @"从化区", @"增城区"];
    NSArray *shenzhenArray = @[@"龙华新区", @"大鹏新区", @"福田区", @"罗湖区", @"宝安区", @"龙岗区", @"南山区"];
    NSDictionary *guangdongCityDict = [NSDictionary dictionaryWithObjectsAndKeys:shenzhenArray, @"深圳市", guangzhouArray, @"广州市", meizhouArray, @"梅州市", nil];
    NSDictionary *guangxiCityDict = [NSDictionary dictionaryWithObjectsAndKeys:@[], @"柳州市", @[], @"桂林市", nil ];
    self.sourceDict = [NSDictionary dictionaryWithObjectsAndKeys:guangdongCityDict, @"广东省", guangxiCityDict, @"广西省", nil ];
    
    
    NSLog(@"meizhouArray = %@",meizhouArray);
    
    // 设置默认值
    self.rowTitleFirst = @"广东省";
    self.rowTitleSecond = @"深圳市";
    [pickerView selectRow:0 inComponent:0 animated:NO];
    [pickerView selectRow:0 inComponent:1 animated:NO];
    [pickerView selectRow:3 inComponent:2 animated:NO];
    
    // 刷新数据
    [pickerView reloadAllComponents];
    
    // 通过textfield来使用
    self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 50+24.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0)];
    [self.view addSubview:self.textfield];
    self.textfield.backgroundColor = [UIColor yellowColor];
    self.textfield.textColor = [UIColor redColor];
    self.textfield.placeholder = @"请选择地址（省市区）";
    // 添加键盘上方的子视图
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 40.0);
    button.backgroundColor = [UIColor greenColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button setTitle:@"隐藏键盘" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(hiddenKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    self.textfield.inputAccessoryView = button;
    //输入源改成地址选择视图
    self.textfield.inputView = pickerView;
    
}




// UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    // 设置列的宽度
    return 100.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    // 设置列中的每行的高度
    return 40.0;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 设置列中的每行的显示标题NSString
    
    // 设置每列每行的标题
    NSArray *keyArray = self.sourceDict.allKeys;
    if (0 == component)
    {
        NSString *title = keyArray[row];
        return title;
    }
    else if (1 ==component)
    {
        NSDictionary *cityDict = self.sourceDict[self.rowTitleFirst];
        NSArray *cityArray = cityDict.allKeys;
        NSString *title = cityArray[row];
        return title;
    }
    else if (2 == component)
    {
        NSDictionary *areaDict = self.sourceDict[self.rowTitleFirst];
        NSArray *areaArray = areaDict[self.rowTitleSecond];
        NSString *title = areaArray[row];
        return title;
    }
    
    return nil;
}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    // 设置列中的每行的显示标题NSAttributedString
//    return nil;
//}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
//{
//    // 设置列中的每行的自定义视图
//    return nil;
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 获取列中选中的某一行
    
    NSLog(@"component = %ld, row = %ld", component, row);
    
    NSArray *keyArray = self.sourceDict.allKeys;
    if (0 == component)
    {
        NSString *keyFirst = keyArray[row];
        // 设置第一列的值，即key1
        self.rowTitleFirst = keyFirst;
        // 当第一列改变时，第二列的值应该跟着改变，即key2，设置为默认第二列的第一个值
        NSDictionary *cityDict = self.sourceDict[self.rowTitleFirst];
        NSArray *cityArray = cityDict.allKeys;
        if (cityArray && 0 < cityArray.count)
        {
            NSString *keySecond = cityArray[0];
            self.rowTitleSecond = keySecond;
        }
        // 设置第三个标题，当第二列改变时，第三wfhr值路着改变
        NSArray *areaArray = cityDict[self.rowTitleSecond];
        if (areaArray && 0 < areaArray.count)
        {
            NSString *keyThird = areaArray[0];
            self.rowTitleThird = keyThird;
        }
        else
        {
            // 没有第三列时，将第三列的默认标题设置为空
            self.rowTitleThird = nil;
        }
        
        // 重新刷新第2列的数据，且设置显示为第一行
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        // 重新刷新第3列的数据，且设置显示为第一行
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    else if (1 ==component)
    {
        // 设置第二个标题
        NSDictionary *cityDict = self.sourceDict[self.rowTitleFirst];
        NSArray *cityArray = cityDict.allKeys;
        NSString *keySecond = cityArray[row];
        self.rowTitleSecond = keySecond;
        
        // 设置第三个标题，默认第一行
        NSArray *areaArray = cityDict[self.rowTitleSecond];
        if (areaArray && 0 < areaArray.count)
        {
            NSString *keyThird = areaArray[0];
            self.rowTitleThird = keyThird;
        }
        
        
        // 重新刷新第3列的数据，且设置显示为第一行
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    else if (2 == component)
    {
        // 设置第三个标题
        NSDictionary *cityDict = self.sourceDict[self.rowTitleFirst];
        NSArray *areaArray = cityDict[self.rowTitleSecond];
        if (areaArray && 0 < areaArray.count)
        {
            NSString *keyThird = areaArray[row];
            self.rowTitleThird = keyThird;
        }
    }
    
    NSString *text = [NSString stringWithFormat:@"%@%@%@", self.rowTitleFirst, self.rowTitleSecond, self.rowTitleThird];
    NSLog(@"选择结果：%@", text);
    
    self.textfield.text = text;
}

// UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // 设置列数
    
    // 设置三列：省、市、区
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 设置每列的行数
    
    // 设置每列的实际行数
    NSArray *keyArray = self.sourceDict.allKeys;
    if (0 == component)
    {
        return keyArray.count;
    }
    else if (1 ==component)
    {
        NSDictionary *cityDict = self.sourceDict[self.rowTitleFirst];
        NSArray *cityArray = cityDict.allKeys;
        return cityArray.count;
    }
    else if (2 == component)
    {
        NSDictionary *areaDict = self.sourceDict[self.rowTitleFirst];
        NSArray *areaArray = areaDict[self.rowTitleSecond];
        return areaArray.count;
    }
    
    return 0;
}

// 隐藏键盘
- (void)hiddenKeyboard:(UIButton *)button
{
    [self.view endEditing:YES];
}

@end
