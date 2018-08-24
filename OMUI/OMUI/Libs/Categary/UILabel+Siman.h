//
//  UILabel+Siman.h
//  OuBoProject
//
//  Created by 欧博 on 15/8/24.
//  Copyright (c) 2015年 OuBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Siman)

/*
 [UILabel LabelWithCustomFontFrame:CGRectMake(0, 0, 85, 15) text:@"常用证件信息" textColor:[UIColor colorForHexString:@"#ffffff"] font:15 textAlignment:NSTextAlignmentCenter]
 */
+ (UILabel *)LabelWithCustomFontFrame:(CGRect)frame
                                 text:(NSString *)text
                            textColor:(UIColor *)textColor
                                 font:(CGFloat)font
                        textAlignment:(NSTextAlignment)textAlignment;

@end
