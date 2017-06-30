//
//  UITextFieldVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UITextFieldVC.h"
#import "NSString+SQTool.h"
@interface UITextFieldVC ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation UITextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self configureUI];
}


- (void)configureUI
{
    
    
    [self.view addSubview:self.textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(-150);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    [_textField addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    

    
   
    
    self.submitButton = [UIButton ButtonWithBorderTitle:@"确认"
                                       titleNormalColor:[UIColor grayColor]
                                 titleHightlightedColor:[UIColor whiteColor]
                                        backgroundColor:KHexColor(@"#ffe4ee")
                             highlightedBackgroundColor:KHexColor(@"#ff5c5d")
                                              titleSize:17
                                                  frame:CGRectZero
                                                    tag:0
                                                 target:self
                                                 action:@selector(submitButtonClick:)];
    
    [self.submitButton setBackgroundImage:[[UIImage imageNamed:@"common_bg_gray"]
                                           stretchableImageWithLeftCapWidth:2 topCapHeight:2]
                                 forState:UIControlStateDisabled];
    self.submitButton.enabled = NO;
    [self.view addSubview:_submitButton];
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(24.0f);
        make.top.equalTo(self.textField.mas_bottom).offset(104);
        make.right.equalTo(self.view.mas_right).offset(-35);
        make.height.equalTo(61.0f);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputTextChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:_textField];

}
#pragma mark -------------------------------------------------------------------------------------------------Click------------------------------------------------------------
-(void)inputTextChanged:(NSNotification *)notification {
    
    UITextField *textField = notification.object;
    NSString *inputText = textField.text;
    self.submitButton.enabled = [inputText  isValid];
}


- (void)submitButtonClick:(UIButton *)button
{
    
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
        _textField.font = [UIFont systemFontOfSize:12];
        _textField.delegate = self;

        
        //①设置placeholder
        
        [self.textField setValue:[UIColor cyanColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self.textField setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
        
        //②设置placeholder
        NSAttributedString * placeholder = [[NSAttributedString alloc] initWithString:@"必填" attributes:@{NSForegroundColorAttributeName :[UIColor redColor]}];
        _textField.attributedPlaceholder = placeholder;
        
        
       
    }
    return _textField;
}

#pragma mark - 判断
- (void)space
{
    //判断有没有空格
    NSString *string = _textField.text;
    NSLog(@"string = %@",string);
    NSRange _range = [string rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        //有空格
        NSLog(@"有空格");
    }else {
        //没有空格
        NSLog(@"没有有空格");
    }

    
    //判断有没有效(空格为无效)
    if ([_textField.text isValid]) {
        NSLog(@"有效");
    }
    else
    {
        NSLog(@"无效");
    }
    
    
    //判断有没有空格
    if ([[_textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
    }


}
#pragma mark - 直接添加监听方法
-(void)textField1TextChange:(UITextField *)textField{
    
    NSLog(@"%@",textField.text);
    [self space];
}

#pragma mark - UITextFieldDelegate
//1. 设置输入框是否可被修改，return no将无法修改，不出现键盘。默认yes可以修改
- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField{
    return YES;
}

//2.点击输入框时执行此方法
- (void)textFieldDidBeginEditing:(UITextField*)textField{
    
}

//3.是否允许结束编辑，允许的话，将会失去first responder 第一响应者（比如键盘）
- (BOOL)textFieldShouldEndEditing:(UITextField*)textField{
    
    return YES;
}

//4.结束编辑(失去第一响应者时执行)
- (void)textFieldDidEndEditing:(UITextField*)textField{
    
}

//5.得到用户输入字符
- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string{
    return YES;
}


//6.当用户全部清空的时候的时候会调用
- (BOOL)textFieldShouldClear:(UITextField*)textField{
    return YES;
}

//7.点击Return键（标志着编辑已经结束了），隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField*)textField{
    
   
    return YES;
}



@end
