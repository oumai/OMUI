//
//  SheetActionView.m
//  YiFu
//
//  Created by Michael on 16/3/11.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "Masonry.h"
#import "SheetActionView.h"
@interface SheetActionView ()
@property (nonatomic, assign) BOOL     isPresented;             ///下滑弹框
@property (nonatomic, strong) UIView   *shangHuaView;
@property (nonatomic, strong) UIButton *paiZhaoButton;
@property (nonatomic, strong) UIButton *chooseButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView   *tanLine;
@property (nonatomic, strong) UIView   *tanLine2;
@end
@implementation SheetActionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTouch)];
        [self addGestureRecognizer:tap];
      
        self.shangHuaView = [UIView new];
        self.shangHuaView.frame = CGRectMake(0, CoreHeight-160, CoreWidth, 160);
        self.shangHuaView.backgroundColor = KHexColor(@"#dbdbdb");
        [self addSubview:_shangHuaView];
        
        [self configureShangHuaView];
        
    }
    return self;
}
- (void)publicButtonClick:(UIButton *)button
{
    if (button.tag == 100)
    {
        
    }
    else if (button.tag == 101)
    {
        
    }
    else if (button.tag == 102)
    {
        
    }
    
    if (self.sheetViewBlock) {
        self.sheetViewBlock(button.tag);
    }
    
}
- (void)tapTouch
{
    [self animationedDismiss];
}


#pragma mark ------------------------------------------------------------------ConfigureUI-------------------------------------------------------------------
- (void)configureShangHuaView
{
    
    self.paiZhaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.paiZhaoButton.titleLabel.font = KFontSize(14);
    self.paiZhaoButton.tag = 100;
    [self.paiZhaoButton setTitle:@"拍照" forState:UIControlStateNormal];
    [self.paiZhaoButton setTitleColor:KHexColor(@"#3e3a39") forState:UIControlStateNormal];
    [self.paiZhaoButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.paiZhaoButton addTarget:self action:@selector(publicButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.shangHuaView addSubview:_paiZhaoButton];
    
    self.tanLine = [UIView new];
    self.tanLine.backgroundColor = KHexColor(@"#d1d1d1");
    self.tanLine.frame = CGRectMake(0, 50, CoreWidth, 0.5);
    [self.shangHuaView addSubview:_tanLine];
    
    
    self.chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chooseButton.titleLabel.font = KFontSize(14);
    self.chooseButton.tag = 101;
    [self.chooseButton setTitle:@"从相册中选取" forState:UIControlStateNormal];
    [self.chooseButton setTitleColor:KHexColor(@"#3e3a39") forState:UIControlStateNormal];//c20c23
    [self.chooseButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.chooseButton addTarget:self action:@selector(publicButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.shangHuaView addSubview:_chooseButton];
    
    
    
    
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelButton.titleLabel.font = KFontSize(14);
    self.cancelButton.tag = 102;
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.cancelButton setTitleColor:KHexColor(@"#3e3a39") forState:UIControlStateNormal];
    [self.cancelButton setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ffffff")] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(publicButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.shangHuaView addSubview:_cancelButton];
    
    
    
    [_paiZhaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangHuaView.mas_top).offset(0);
        make.left.equalTo(self.shangHuaView.mas_left).offset(0);
        make.right.equalTo(self.shangHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];
    
    
    [_chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangHuaView.mas_top).offset(50.5);
        make.left.equalTo(self.shangHuaView.mas_left).offset(0);
        make.right.equalTo(self.shangHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangHuaView.mas_top).offset(110);
        make.left.equalTo(self.shangHuaView.mas_left).offset(0);
        make.right.equalTo(self.shangHuaView.mas_right).offset(0);
        make.height.equalTo(50);
    }];

}
- (void)animationPresent
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    self.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    [UIView commitAnimations];
}
- (void)animationedDismiss
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    self.frame = CGRectMake(0, CoreHeight, CoreWidth, CoreHeight);
    [UIView commitAnimations];

}
@end
