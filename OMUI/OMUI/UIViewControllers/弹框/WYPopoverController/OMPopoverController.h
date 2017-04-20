//
//  OMPopoverController.h
//  OMUI
//
//  Created by Omichael on 2017/4/11.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMPopoverController : UIViewController

@property (nonatomic, strong) void(^dismissBlock)(OMPopoverController *);
@property (nonatomic, strong) void(^sureButtonBlock)(OMPopoverController *);
@end
