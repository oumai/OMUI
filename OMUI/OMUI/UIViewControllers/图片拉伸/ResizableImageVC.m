//
//  ResizableImageVC.m
//  OMUI
//
//  Created by kmom on 2018/10/25.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "ResizableImageVC.h"

@interface ResizableImageVC ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ResizableImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    self.button.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.button.tag = 100;
    self.button.frame = CGRectMake(100, 100, 200, 29);
    //self.button.center = CGPointMake(375/2, 200);
    [self.button setBackgroundImage:[self resizableImage:@"问券_选中"] forState:UIControlStateNormal];
    [self.button setTitle:@"  从无吃放我可以抱你吗  " forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view.mas_left).offset(100);

    }];
    
    
    NSLog(@"%@ frame = %@",NSStringFromCGPoint(self.button.center),NSStringFromCGRect(self.button.frame));
}

/**
 
 *返回一张可以随意拉伸不变形的
 *
 *@param name 图片名称
 */

- (UIImage *)resizableImage:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width*0.5;
    CGFloat h = normal.size.width*0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(w, h, w, h)];
}
@end
