//
//  UserInterfaceVC.h
//  OMUI
//
//  Created by Omichael on 2017/3/31.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInterfaceVC : UIViewController
//枚举
typedef NS_ENUM(NSInteger , TypeOfCell)
{
    oneCell   = 100,
    twoCell   = 101,
    threeCell = 102,
    fourCell  = 103,
    fiveCell  = 104,
    sixCell   = 105,
};
@property (nonatomic, assign) TypeOfCell type;


//控件枚举

typedef NS_ENUM(NSInteger , Type)
{
    typeOfLabel     = 0,
    typeOfTextF     = 1,
    typeOfButton    = 2,
    typeOfImage     = 3,
    typeOfView      = 4,
    typeOfSement    = 5,
    typeOfSlider    = 6,
    typeOfStepper   = 7,
    typeOfProgress  = 8,
    typeOfSwitch    = 9
};
@property (nonatomic, assign) Type typeui;
@end
