//
//  UIButton+Tool.h
//  QieyouToolKit
//
//  Created by 欧博 on 15/6/9.
//  Copyright (c) 2015年 欧博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Tool)
@property (nonatomic, strong) UIColor *highlightedBackgroundColor;

+(id)ButtonWithBorderTitle:(NSString *)title
          titleNormalColor:(UIColor *)titleNormalColor
    titleHightlightedColor:(UIColor *)titleHightlightedColor
           backgroundColor:(UIColor *)backgroundColor
highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor
                 titleSize:(CGFloat)fontSize
                     frame:(CGRect)frame
                       tag:(NSInteger)tag
                    target:(id)target
                    action:(SEL)selector;

@end
