//
//  UITextFieldVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UITextFieldVC.h"

@interface UITextFieldVC ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation UITextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
}
#pragma mark -------------------------------------------------------------------------------------------------UITextField------------------------------------------------------------
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.textColor = KHexColor(@"ff0000");
        _textField.placeholder = @"textField";
        _textField.backgroundColor = [UIColor lightGrayColor];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        

    }
    return _textField;
}

@end
