//
//  LazyInitVC.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/19.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ConfigureUI) {
    
    UILabelType,
    UITextFieldType,
    UIButtonnType,
    UIImageViewType,
    UIViewType,
    UISegmentedControlType,
    UISliderType,
    UIStepperType,
    UIProgressViewType,
    UISwitchType,
};
//typedef enum
//{
//    //以下是枚举成员
//    UILabelType,
//    UITextFieldType,
//    UIButtonnType,
//    UIImageViewType,
//    UIViewType,
//    UISegmentedControlType,
//    UISliderType,
//    UIStepperType,
//    UIProgressViewType,
//    UISwitchType,
//
//}ConfigureUI;
//

@interface LazyInitVC : UIViewController

@property (nonatomic, assign) ConfigureUI typeui;

@end
