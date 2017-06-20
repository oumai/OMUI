//
//  UIProgressViewVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIProgressViewVC.h"

@interface UIProgressViewVC ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation UIProgressViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_progressView];
    
    
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
}

#pragma mark -------------------------------------------------------------------------------------------------UIProgressView------------------------------------------------------------
- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [UIProgressView new];   //进度条
        _progressView.progress = 0.2;
        _progressView.layer.cornerRadius = 3;
        _progressView.layer.masksToBounds = YES;
        _progressView.tintColor = KHexColor(@"#f08491");
        _progressView.trackTintColor = KHexColor(@"#c5c5c5");
        [_progressView setProgressViewStyle:(UIProgressViewStyleDefault)];
    }
    return _progressView;
}
@end
