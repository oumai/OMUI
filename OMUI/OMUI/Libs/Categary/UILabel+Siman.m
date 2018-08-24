//
//  UILabel+Siman.m
//  OuBoProject
//
//  Created by 欧博 on 15/8/24.
//  Copyright (c) 2015年 Oubo. All rights reserved.
//
#define KFontSize(font) [UIFont systemFontOfSize:font]

#import "UILabel+Siman.h"

@implementation UILabel (Siman)

+ (UILabel *)LabelWithCustomFontFrame:(CGRect)frame
                                 text:(NSString *)text
                            textColor:(UIColor *)textColor
                                 font:(CGFloat)font
                        textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = KFontSize(font);
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = textAlignment;
    return label;
    
}

@end
