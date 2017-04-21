//
//  KMGestureRecognizer.h
//  TestOnIphone
//
//  Created by Omichael on 2017/4/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, Direction) {
    DirectionUnknown,
    DirectionLeft,
    DirectionRight
};
@interface KMGestureRecognizer : UIGestureRecognizer

@property (assign, nonatomic) NSUInteger tickleCount; //挠痒次数
@property (assign, nonatomic) CGPoint currentTickleStart; //当前挠痒开始坐标位置
@property (assign, nonatomic) Direction lastDirection; //最后一次挠痒方向

@end
