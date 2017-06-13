//
//  RdiusViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/13.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "RadiusViewController.h"

@interface RadiusViewController ()

@end

@implementation RadiusViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"部分圆角的切割";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureRadius2];
}
- (void)onButtonClickAction
{
    
}
- (void)configureRadius1
{
    UIButton * testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 74, 200, 64)];
    [testButton setBackgroundColor:[UIColor lightGrayColor]];
    [testButton addTarget:self action:@selector(onButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    CALayer * temp = [CALayer layer];
    temp.frame = CGRectMake(1, 1, testButton.bounds.size.width - 2, testButton.bounds.size.height - 2);
    [temp setBackgroundColor:[UIColor redColor].CGColor];
    
    //圆角的切割
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:temp.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    
    CAShapeLayer * mask  = [[CAShapeLayer alloc] initWithLayer:temp];
    mask.path = path.CGPath;
    temp.mask = mask;
    [testButton.layer addSublayer:temp];
    
    
    //背景圆角的切割
    UIBezierPath * path2 = [UIBezierPath bezierPathWithRoundedRect:testButton.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(0, 0)];
    CAShapeLayer * mask2  = [[CAShapeLayer alloc] initWithLayer:temp];
    mask2.path = path2.CGPath;
    testButton.layer.mask = mask2;
    

}

- (void)configureRadius2
{
    UIButton * testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 74, 200, 64)];
    [testButton setBackgroundColor:[UIColor lightGrayColor]];
    [testButton addTarget:self action:@selector(onButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];
    
    CGFloat borderWidth = 10.0;
    CGFloat radius = 50.0f;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:testButton.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer * mask  = [[CAShapeLayer alloc] init];
    mask.path = path.CGPath;
    testButton.layer.mask = mask;
    
    CALayer * temp = [CALayer layer];
    [temp setBackgroundColor:[UIColor whiteColor].CGColor];
    temp.frame = CGRectMake(borderWidth, borderWidth, testButton.bounds.size.width - borderWidth * 2, testButton.bounds.size.height - borderWidth * 2);
    
    UIBezierPath * subPath = [UIBezierPath bezierPathWithRoundedRect:temp.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(radius - borderWidth, radius - borderWidth)];
    CAShapeLayer * subMask  = [[CAShapeLayer alloc] initWithLayer:temp];
    subMask.path = subPath.CGPath;
    temp.mask = subMask;
    
    [testButton.layer addSublayer:temp];
}

@end
