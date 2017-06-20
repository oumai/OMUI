
//
//  UISwitchVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UISwitchVC.h"

@interface UISwitchVC ()
@property (nonatomic, strong) UISwitch *switchOn;
@end

@implementation UISwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.switchOn];
    
    /*
     1、onTintColor设置开启颜色；
     2、onImage设置开启图片；
     3、tintColor设置正常关闭颜色；
     4、offImage设置关闭图片；
     5、thumbTintColor设置圆形按钮颜色；
     */
    
    [_switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(51);
        make.height.equalTo(31);
    }];

}

#pragma mark -------------------------------------------------------------------------------------------------UISwitch------------------------------------------------------------
- (UISwitch *)switchOn
{
    if (!_switchOn) {
        _switchOn = [UISwitch new];
        _switchOn.on = YES;
        _switchOn.onTintColor = [UIColor redColor];
        _switchOn.tintColor = [UIColor blueColor];
        _switchOn.thumbTintColor = [UIColor yellowColor];
        [_switchOn addTarget:self action:@selector(switchOnClick:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchOn;
    
}
- (void)switchOnClick:(id)sender
{
    UISwitch *switc = (UISwitch *)sender;
    BOOL isButtonOn = [switc isOn];
    if (isButtonOn) {
        NSLog(@"是");
    }
    else
    {
        NSLog(@"否");
    }
}
@end
