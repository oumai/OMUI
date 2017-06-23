
//
//  KMCloudHealth.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#ifndef KMCloudHealth_h
#define KMCloudHealth_h
/*③康美云健康*/

// Color
// 主色-黄色
#define kMainColor          RGB(0x2f, 0x8a, 0xff)
// 辅色-橘黄
#define kOrangeColor        RGB(0xf7, 0x51, 0x08)
// 对话框蓝色
#define kBuleColor          RGB(0x3f, 0xcd, 0xb5)

// 大红色 f36060
#define kRedColor           RGB(0xf3, 0x60, 0x60)

// 灰色-侧滑背景，标题，重要内容
#define kGrayColor          RGB(0x27, 0x26, 0x36)
// 正文
#define kGrayContextColor   RGB(0xa3, 0xa3, 0xa3)
// 提示文字
#define kGrayTipColor       RGB(0x9a, 0x9a, 0x9a)
// 背景
#define kGrayBackColor      RGB(0xea, 0xea, 0xea)

// 健康文档数据显示高度
#define kMedicalHeight 40
#define RGB(r,g,b)          [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


#define URLString @"http://djymbgl.kmhealthcloud.com:9001/#/tab/healthArchive/basicInfoCompleteness?Authorization=Basic%20ODYxMjMyMDExMTIwMDc1OjM4MTA3MzI2ODg=&userCode=3810732688"
#endif /* KMCloudHealth_h */
