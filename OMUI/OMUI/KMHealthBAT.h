
//
//  HealthBAT.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#ifndef KMHealthBAT_h
#define KMHealthBAT_h

/*②健康BAT*/
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


//背景灰色
#define BASE_BACKGROUND_COLOR UIColorFromHEX(0xf5f5f5, 1)
//颜色
// RGB颜色转换（16进制->10进制）
#define UIColorFromHEX(rgbValue,A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:A]
#define UIColorFromRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]


#endif /* KMHealthBAT_h */
