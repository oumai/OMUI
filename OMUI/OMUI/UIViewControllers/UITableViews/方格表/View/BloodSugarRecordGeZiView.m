//
//  BloodSugarRecordGeZiView.m
//  BloodPressure
//
//  Created by Michael on 16/4/26.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "BloodSugarRecordGeZiView.h"

@implementation BloodSugarRecordGeZiView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.f);
    CGContextSetStrokeColorWithColor(context, KHexColor(@"#e5e5e5").CGColor);
    
    for (int i =0; i<2; i++) {
        CGContextMoveToPoint(context, 0, 0+i*CoreWidth*3/4/8);
        CGContextAddLineToPoint(context, CoreWidth, 0+i*CoreWidth*3/4/8);
    }
    CGContextStrokePath(context);
    
    
    //竖轴
    CGContextRef contextY = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextY, 1.f);
    CGContextSetStrokeColorWithColor(contextY, KHexColor(@"#e5e5e5").CGColor);
    
    for (int i =0; i<8; i++) {
        CGContextMoveToPoint(contextY, 0+i*CoreWidth/8, 0);
        CGContextAddLineToPoint(contextY, 0+i*CoreWidth/8, CoreWidth*3/4/8);
    }
    CGContextStrokePath(contextY);
    
}
@end
