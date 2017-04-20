//
//  DetailUIVC.h
//  OMUI
//
//  Created by Omichael on 2017/4/1.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailUIVC : UIViewController

//控件枚举
typedef NS_ENUM(NSInteger , TypeOfDetailUIVC)
{
    typeOfLabelDetailUIVC     = 0,
    typeOfTextFDetailUIVC     = 1,
    typeOfButtonDetailUIVC    = 2,
    typeOfImageDetailUIVC     = 3,
    typeOfViewDetailUIVC      = 4,
    typeOfSementDetailUIVC    = 5,
    typeOfSliderDetailUIVC    = 6,
    typeOfStepperDetailUIVC   = 7,
    typeOfProgressDetailUIVC  = 8,
    typeOfSwitchDetailUIVC    = 9
};
@property (nonatomic, assign) TypeOfDetailUIVC typeui;

@end
