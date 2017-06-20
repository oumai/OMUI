//
//  UIStepperVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIStepperVC.h"

@interface UIStepperVC ()
@property (nonatomic, strong) UIStepper *stepper;
@end

@implementation UIStepperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.stepper];
    
    [_stepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(20);
    }];
}

#pragma mark -------------------------------------------------------------------------------------------------UIStepper------------------------------------------------------------

- (UIStepper *)stepper
{
    if (!_stepper) {
        
        _stepper = [UIStepper new];            //加减
        _stepper.minimumValue = 0;
        _stepper.maximumValue = 20;
        _stepper.stepValue = 2;  //点击＋2
        _stepper.value = 3;
        [_stepper addTarget:self action:@selector(stepperClick:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepper;
}
- (void)stepperClick:(UIStepper *)stepper
{
    NSInteger index = stepper.value;
    NSLog(@"index = %ld",index);
}
@end
