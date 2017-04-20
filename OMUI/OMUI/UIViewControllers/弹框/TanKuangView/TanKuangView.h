//
//  TanKuangView.h
//  YiFu
//
//  Created by Michael on 16/3/9.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TanKuangView : UIView
@property (nonatomic, strong) UINavigationController *navigation;
@property (nonatomic, strong) void(^tankuangDismissBlock)(NSInteger);

- (void)animationPresent;
- (void)animationedDismiss;

@end
