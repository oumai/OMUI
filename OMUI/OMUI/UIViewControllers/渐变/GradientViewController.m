//
//  GradientViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/13.
//  Copyright © 2017年 康美. All rights reserved.
//

//渐变色
#define START_COLOR UIColorFromHEX(0x29ccbf, 1)
#define END_COLOR UIColorFromHEX(0x6ccc56, 1)



//颜色
// RGB颜色转换（16进制->10进制）
#define UIColorFromHEX(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
#define UIColorFromRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#import "GradientViewController.h"
#import "BATCustomButton.h"
#import "BATGraditorButton.h"
@interface GradientViewController ()

@property (nonatomic,strong) BATGraditorButton *courseBtn;


@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"渐变";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.courseBtn];
   
}

- (BATGraditorButton *)courseBtn{
    if (!_courseBtn) {
        //        _courseBtn = [UIButton  buttonWithType:UIButtonTypeCustom Title:@"他的课程" titleColor:UIColorFromHEX(0x0182eb, 1) backgroundColor:nil backgroundImage:nil Font:[UIFont systemFontOfSize:14]];
        //        _courseBtn.layer.cornerRadius = 2;
        //        _courseBtn.layer.borderColor = UIColorFromHEX(0x0182eb, 1).CGColor;
        //        _courseBtn.layer.borderWidth = 1;
        
        
        _courseBtn = [BATGraditorButton buttonWithType:UIButtonTypeCustom];
        _courseBtn.frame = CGRectMake(100, 100, 80, 30);
        [_courseBtn setTitle:@"他的课程" forState:UIControlStateNormal];
        //[_courseBtn setImage:[UIImage imageNamed:@"Emoticon_tusiji_icon"] forState:UIControlStateNormal];
        _courseBtn.layer.cornerRadius = 5.0f;
        _courseBtn.layer.masksToBounds = YES;
        _courseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_courseBtn setGradientColors:@[START_COLOR,END_COLOR]];
        
        
       
    }
    return _courseBtn;
}
@end
