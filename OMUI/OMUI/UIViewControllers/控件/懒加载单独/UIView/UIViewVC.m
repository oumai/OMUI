//
//  UIViewVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIViewVC.h"

@interface UIViewVC ()
@property (nonatomic, strong) UIView *myView;
@end

@implementation UIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
    [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];

}

#pragma mark -------------------------------------------------------------------------------------------------UIView------------------------------------------------------------

- (UIView *)myView
{
    if (!_myView) {
        
        _myView = [UIView new];
        _myView.backgroundColor = KHexColor(@"#ebebeb");
        
    }
    return _myView;
}

@end
