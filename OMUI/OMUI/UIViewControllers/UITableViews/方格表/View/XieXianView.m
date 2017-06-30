//
//  XieXianView.m
//  AngelSound
//
//  Created by Michael on 16/4/28.
//  Copyright © 2016年 Jumper. All rights reserved.
//
#define GeZiHeight CoreWidth*3/8/4
#define GeZiWidth  CoreWidth/8
#import "XieXianView.h"

@implementation XieXianView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //斜线
    CGContextRef contextXieXian = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextXieXian, 1.f);
    CGContextSetStrokeColorWithColor(contextXieXian, KHexColor(@"#e5e5e5").CGColor);
    CGContextMoveToPoint(contextXieXian, 8, 4);
    CGContextAddLineToPoint(contextXieXian, GeZiWidth-8, GeZiHeight-4);
    CGContextStrokePath(contextXieXian);
}


@end
