//
//  UISliderVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UISliderVC.h"

@interface UISliderVC ()
@property (nonatomic, strong) UISlider *slider;
@end

@implementation UISliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.slider];

    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(20);
    }];

}

#pragma mark -------------------------------------------------------------------------------------------------UISlider------------------------------------------------------------
- (UISlider *)slider
{
    if (!_slider) {
        _slider = [UISlider new];
        //self.slider.minimumValue = 0;
        //self.slider.maximumValue = 100;
        _slider.value = 0.5;
        _slider.backgroundColor = [UIColor whiteColor];
        [_slider setMinimumTrackImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
        [_slider setMaximumTrackImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _slider;
    
}
- (void)sliderClick:(UISlider *)slider
{
    float floa = slider.value;
    self.view.alpha = floa;
    NSLog(@"floa = %f",floa);
}

@end
