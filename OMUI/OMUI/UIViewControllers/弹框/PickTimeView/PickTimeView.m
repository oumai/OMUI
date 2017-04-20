//
//  PickTimeView.m
//  RemindAndPushMessage
//
//  Created by Mac mini on 2017/3/4.
//  Copyright © 2017年 Mac mini. All rights reserved.
//

#import "PickTimeView.h"

@implementation PickTimeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        

        self.backgroundColor = [UIColor clearColor];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTouch)];
        [self addGestureRecognizer:tap];
        
        self.bgView = [UIView new];
        self.bgView.layer.cornerRadius = 8;
        self.bgView.layer.masksToBounds = YES;
        self.bgView.backgroundColor = KHexColor(@"#03a9f4");
        [self addSubview:self.bgView];
        
        
        [_bgView   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(0);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.width.equalTo(CoreWidth-60);
            make.height.equalTo(240);
        }];
        
        
        
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:KHexColor(@"#333333") forState:UIControlStateNormal];
        [self.cancelButton setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_cancelButton];
        
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(0);
            make.left.equalTo(self.bgView.mas_left).offset(0);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];
        
        self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [self.sureButton setTitleColor:KHexColor(@"#333333") forState:UIControlStateNormal];
        [self.sureButton setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [self.sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_sureButton];
        
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(0);
            make.right.equalTo(self.bgView.mas_right).offset(0);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [formatter setDateFormat:@"HH:mm"];
        NSDate *date = [formatter dateFromString:@"01:00"];
        
        self.startPicker = [[ UIDatePicker alloc] init];
        self.startPicker.datePickerMode = UIDatePickerModeTime;
        self.startPicker.backgroundColor = [UIColor clearColor];
        self.startPicker.tag = 100;
        self.startPicker.date = date;
        [self.startPicker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
        [self.startPicker setValue:KHexColor(@"#333333") forKey:@"textColor"]; //设置字体颜色
        [self addSubview:_startPicker];
        
        
        
        [_startPicker   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView.mas_left).offset(30);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.right.equalTo(self.bgView.mas_centerX).offset(0);
            make.height.equalTo(120);
        }];

        
        
        self.startTitleLabel = [UILabel new];
        self.startTitleLabel.textColor = [UIColor clearColor];
        self.startTitleLabel.font = [UIFont systemFontOfSize:14];
        self.startTitleLabel.text = @"开始时间";
        [self.startPicker addSubview:_startTitleLabel];
        
        
        
        [_startTitleLabel   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.startPicker.mas_centerX).offset(0);
            make.bottom.equalTo(self.startPicker.mas_top).offset(-10);
            make.width.equalTo(self.startTitleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        self.startMaoHaoLabel = [UILabel new];
        self.startMaoHaoLabel.textColor = [UIColor groupTableViewBackgroundColor];
        self.startMaoHaoLabel.font = [UIFont boldSystemFontOfSize:18];
        self.startMaoHaoLabel.text = @":";
        [self.startPicker addSubview:_startMaoHaoLabel];
        
        
        
        [_startMaoHaoLabel   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.startPicker.mas_centerX).offset(0);
            make.centerY.equalTo(self.startPicker.mas_centerY).offset(0);
            make.width.equalTo(self.startMaoHaoLabel.mas_width);
            make.height.equalTo(18);
        }];
        
        
        self.finishedPicker = [ [ UIDatePicker alloc] initWithFrame:CGRectMake(100,100,100,100)];
        self.finishedPicker.datePickerMode = UIDatePickerModeTime;
        self.finishedPicker.backgroundColor = [UIColor clearColor];
        NSDate *finishDate = [formatter dateFromString:@"04:00"];
        self.finishedPicker.date = finishDate;
        self.finishedPicker.tag = 101;
        [self.finishedPicker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
        [self.finishedPicker setValue:KHexColor(@"#333333") forKey:@"textColor"]; //设置字体颜色
        [self addSubview:_finishedPicker];
        
        
        
        [_finishedPicker   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView.mas_centerX).offset(0);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.right.equalTo(self.bgView.mas_right).offset(-30);
            make.height.equalTo(120);
        }];
        
        
        self.finishTitleLabel = [UILabel new];
        self.finishTitleLabel.textColor = [UIColor clearColor];
        self.finishTitleLabel.font = [UIFont systemFontOfSize:14];
        self.finishTitleLabel.text = @"结束时间";
        [self.startPicker addSubview:_finishTitleLabel];
        
        
        
        [_finishTitleLabel   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.finishedPicker.mas_centerX).offset(0);
            make.bottom.equalTo(self.finishedPicker.mas_top).offset(-10);
            make.width.equalTo(self.finishTitleLabel.mas_width);
            make.height.equalTo(14);
        }];

        
        
        self.finishedMaoHaoLabel = [UILabel new];
        self.finishedMaoHaoLabel.textColor = [UIColor groupTableViewBackgroundColor];;
        self.finishedMaoHaoLabel.font = [UIFont boldSystemFontOfSize:18];
        self.finishedMaoHaoLabel.text = @":";
        [self.finishedPicker addSubview:_finishedMaoHaoLabel];
        
        
        
        [_finishedMaoHaoLabel   mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.finishedPicker.mas_centerX).offset(0);
            make.centerY.equalTo(self.finishedPicker.mas_centerY).offset(0);
            make.width.equalTo(self.finishedMaoHaoLabel.mas_width);
            make.height.equalTo(18);
        }];

        
    }
    
    return self;
}
- (void)tapTouch
{
    [self animationedDismiss];
}
- (void)cancelButtonClick:(UIButton *)button
{
   
    
    [self animationedDismiss];
//    if (self.cancelButton)
//    {
//        self.cancelButtonBlock(self);
//    }
    
    
}
- (void)pickerChanged:(UIDatePicker *)picker
{
    
    if (picker.tag == 100) {
        
        NSLog(@"100 %s",__func__);
        
        NSDate *theDate = self.startPicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        self.startString = [dateFormatter stringFromDate:theDate];
        NSLog(@"%@",[dateFormatter stringFromDate:theDate]);
    }
    
    if (picker.tag == 101) {
        
        NSLog(@"101 %s",__func__);
        
        NSDate *theDate = self.finishedPicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
        self.finishString = [dateFormatter stringFromDate:theDate];
        NSLog(@"%@",[dateFormatter stringFromDate:theDate]);
    }
   
}

- (void)sureButtonClick:(UIButton *)button
{
    
    NSLog(@"self.startPicker.date %@   %@",self.startPicker.date,self.finishedPicker.date);
    
    if (self.sureButtonBlock)
    {
        self.sureButtonBlock(self);
    }

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
