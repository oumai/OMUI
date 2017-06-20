//
//  UILabelVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UILabelVC.h"

@interface UILabelVC ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation UILabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(self.titleLabel.mas_width);
        make.height.equalTo(14);
    }];

}
#pragma mark -------------------------------------------------------------------------------------------------UILabel------------------------------------------------------------
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = KHexColor(@"#999999");
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"titleLabel";
    }
    return _titleLabel;
}

@end
