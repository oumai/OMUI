//
//  UIButtonVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIButtonVC.h"

@interface UIButtonVC ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation UIButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];

}

#pragma mark -------------------------------------------------------------------------------------------------Button------------------------------------------------------------
- (UIButton *)button
{
    
    //    self.button.layer.cornerRadius = 10;
    //    self.button.layer.masksToBounds = YES;
    //    self.button.layer.borderWidth = 1;
    //    self.button.layer.borderColor = KHexColor(@"#ff8787").CGColor;
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont systemFontOfSize:14];
        [_button setTitle:@"button" forState:UIControlStateNormal];
        [_button setTitleColor:KHexColor(@"#000000") forState:UIControlStateNormal];
        [_button setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ebebeb")] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _button;
}
- (void)buttonClick:(UIButton *)btn
{
    
}
@end
