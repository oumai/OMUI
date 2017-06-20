//
//  UIImageViewVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIImageViewVC.h"

@interface UIImageViewVC ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation UIImageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];

}

#pragma mark -------------------------------------------------------------------------------------------------UIImageView------------------------------------------------------------

- (UIImageView *)ConfigureUIImageView
{
    
    if (!_imageView) {
        
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"contentMode"];
        _imageView.layer.cornerRadius = 25;
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.borderWidth = 0.5;
        _imageView.layer.borderColor = KHexColor(@"#ff00000").CGColor;

    }
    
    return _imageView;
}

@end
