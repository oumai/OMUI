//
//  Header.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#ifndef Header_h
#define Header_h
/*①本身*/
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#define CoreWidth [UIScreen mainScreen].bounds.size.width
#define CoreHeight [UIScreen mainScreen].bounds.size.height
#define KFontSize(font) [UIFont systemFontOfSize:font]
#define KHexColor(stringColor) [UIColor colorForHexString:stringColor]


#import "Masonry.h"
#import "TTTAttributedLabel.h"
#import "UIColor+HNExtensions.h"
#import "UIButton+SQTool.h"
#import "UIButton+Tool.h"
#import "UIImage+Tool.h"


#define DeepColor       KHexColor(@"#3e3a39")
#define LightColor      KHexColor(@"#878787")
#define BackgroundColor KHexColor(@"#f24818")
#define LineColor       KHexColor(@"#c6c6c6")


#endif /* Header_h */
