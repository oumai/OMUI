//
//  WYWebProgressLayer.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface WYWebProgressLayer : CAShapeLayer
- (void)finishedLoad;
- (void)startLoad;

- (void)closeTimer;


@end
