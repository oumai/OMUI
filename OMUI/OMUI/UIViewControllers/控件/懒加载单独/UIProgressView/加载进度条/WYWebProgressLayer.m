//
//  WYWebProgressLayer.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "WYWebProgressLayer.h"

static NSTimeInterval const kFastTimeInterval = 0.003;


@implementation WYWebProgressLayer {
    CAShapeLayer *_layer;
    
    NSTimer *_timer;
    CGFloat _plusWidth; ///< 增加点
}

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}


- (void)initialize {
    self.lineWidth = 2;
    self.strokeColor = kMainColor.CGColor;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:kFastTimeInterval target:self selector:@selector(pathChanged:) userInfo:nil repeats:YES];
    if (!_timer.isValid) return;
    [_timer setFireDate:[NSDate distantFuture]];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 2)];
    [path addLineToPoint:CGPointMake(SCREEN_WIDTH, 2)];
    
    self.path = path.CGPath;
    self.strokeEnd = 0;
    _plusWidth = 0.01;
}

- (void)pathChanged:(NSTimer *)timer {
    self.strokeEnd += _plusWidth;
    
    if (self.strokeEnd > 0.8) {
        _plusWidth = 0.002;
    }
}

- (void)startLoad {
    if (!_timer.isValid) return;
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:kFastTimeInterval]];
}

- (void)finishedLoad {
    [self closeTimer];
    
    self.strokeEnd = 1.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
        [self removeFromSuperlayer];
    });
}

- (void)dealloc {
    //    NSLog(@"progressView dealloc");
    [self closeTimer];
}

#pragma mark - private
- (void)closeTimer {
    [_timer invalidate];
    _timer = nil;
}





@end

