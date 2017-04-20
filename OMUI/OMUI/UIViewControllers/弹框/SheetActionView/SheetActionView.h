//
//  SheetActionView.h
//  YiFu
//
//  Created by Michael on 16/3/11.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheetActionView : UIView
@property (nonatomic, strong) void(^sheetViewBlock)(NSInteger);

- (void)animationPresent;
- (void)animationedDismiss;


@end
