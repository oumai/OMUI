//
//  OMPopoverController.m
//  OMUI
//
//  Created by Omichael on 2017/4/11.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "OMPopoverController.h"

@interface OMPopoverController ()
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UIButton *cancelButton;
@end

@implementation OMPopoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.sureButton.tag = 100;
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.sureButton setTitleColor:KHexColor(@"#000000") forState:UIControlStateNormal];
    [self.sureButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ebebeb")] forState:UIControlStateNormal];
    [self.sureButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureButton];
    
    [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view.mas_top).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(30);
    }];
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.cancelButton.tag = 101;
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:KHexColor(@"#000000") forState:UIControlStateNormal];
    [self.cancelButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ebebeb")] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelButton];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.top.equalTo(self.view.mas_top).offset(10);
        make.width.equalTo(60);
        make.height.equalTo(30);
    }];


}
- (void)buttonClick:(UIButton *)button
{
    
    if (button.tag == 100) {
        if (self.dismissBlock) {
            self.dismissBlock(self);
        }

    }
    else if (button.tag == 101)
    {
        if (self.sureButtonBlock) {
            self.sureButtonBlock(self);
        }

    }
}
@end
