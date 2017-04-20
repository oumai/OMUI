//
//  PickTimeView.h
//  RemindAndPushMessage
//
//  Created by Mac mini on 2017/3/4.
//  Copyright © 2017年 Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickTimeView : UIView


@property (nonatomic, strong) void(^cancelButtonBlock)(PickTimeView *);
@property (nonatomic, strong) void(^sureButtonBlock)(PickTimeView *);
@property (nonatomic, strong) UIView        *bgView;
@property (nonatomic, strong) UIButton      *cancelButton;
@property (nonatomic, strong) UIButton      *sureButton;
@property (nonatomic, strong) UIDatePicker *startPicker;
@property (nonatomic, strong) UIDatePicker *finishedPicker;
@property (nonatomic, strong) UILabel *startTitleLabel;
@property (nonatomic, strong) UILabel *finishTitleLabel;
@property (nonatomic, strong) UILabel *startMaoHaoLabel; //冒号:
@property (nonatomic, strong) UILabel *finishedMaoHaoLabel;

@property (strong , nonatomic)NSString *startString;
@property (strong , nonatomic)NSString *finishString;



- (void)animationPresent;
- (void)animationedDismiss;

@end
