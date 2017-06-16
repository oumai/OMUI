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



//定义设备的类型
#define iPad   (([UIScreen mainScreen].currentMode.size.height) == 1024?YES:NO)
#define iPadAir   (([UIScreen mainScreen].currentMode.size.height) == 2048?YES:NO)
#define iPhone4   (([UIScreen mainScreen].currentMode.size.height) == 960?YES:NO)
#define iPhone5   (([UIScreen mainScreen].currentMode.size.height) == 1136?YES:NO)
#define iPhone6   (([UIScreen mainScreen].currentMode.size.height) == 1334?YES:NO)

#import "GradientViewController.h"
#import "BATCustomButton.h"
#import "BATGraditorButton.h"
@interface GradientViewController ()
{
    CGFloat _commentBigHeight;  //scrollview实际高度
    CGFloat _commentFontPoor;
    CGFloat _commentIntervalHeight;

}

@property (nonatomic,strong) BATGraditorButton *courseBtn;
@property (nonatomic,strong) BATGraditorButton *descLabel;


@end

@implementation GradientViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        if (iPhone5) {
            _commentBigHeight = 280;
            _commentFontPoor = 3;
            _commentIntervalHeight = 10;
        }else if (iPhone6){
            _commentBigHeight = 320;
            _commentFontPoor = 0;
            _commentIntervalHeight = 0;
        }else{
            _commentBigHeight = 350;
            _commentFontPoor = 0;
            _commentIntervalHeight = 0;
        }

    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"渐变";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.courseBtn];
    [self.view addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(10);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
    }];

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


- (BATGraditorButton *)descLabel{
    if (!_descLabel) {
        _descLabel = [[BATGraditorButton alloc]initWithFrame:CGRectZero];
        [_descLabel setTitle:@"值班医生正在为您服务" forState:UIControlStateNormal] ;
        _descLabel.enbleGraditor = YES;
        _descLabel.titleLabel.font = [UIFont systemFontOfSize:18 - _commentFontPoor];
        [_descLabel setGradientColors:@[START_COLOR,END_COLOR]];
    }
    return _descLabel;
}

@end
