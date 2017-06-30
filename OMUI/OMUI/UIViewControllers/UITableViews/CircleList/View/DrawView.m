//
//  DrawView.m
//  HealthNutritionManager
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 欧博. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(self.context, CGRectMake(12.5, 12.5, 15, 15));  ///椭圆
    if (self.index == 1) {
        CGContextSetRGBStrokeColor(self.context, 255/255.f, 135/255.f, 128/255.f, 1);
    }else if (self.index == 2)
    {
        CGContextSetRGBStrokeColor(self.context, 255/255.f, 137/255.f, 99/255.f, 1);
        
    }
    else if (self.index == 3)
    {
        CGContextSetRGBStrokeColor(self.context, 251/255.f, 218/255.f, 102/255.f, 1);
        
    }
    else if (self.index == 4)
    {
        CGContextSetRGBStrokeColor(self.context, 176/255.f, 224/255.f, 96/255.f, 1);
        
    }
    else if (self.index == 5)
    {
        CGContextSetRGBStrokeColor(self.context, 113/255.f, 223/255.f, 223/255.f, 1);
        
    }
    else if (self.index == 6)
    {
        CGContextSetRGBStrokeColor(self.context, 143/255.f, 135/255.f, 227/255.f, 1);
        
    }
    else if (self.index == 7)
    {
        CGContextSetRGBStrokeColor(self.context, 201/255.f, 200/255.f, 201/255.f, 1);
        
    }
    
    CGContextSetLineWidth(self.context, 15);
    CGContextStrokePath(self.context);
    
    CGRect strRect = CGRectMake(12.5, 12.5, 40, 40);
    NSString *string = self.stringLabel;                     //加一个字符串
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName];
    [dict setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [string drawInRect:strRect withAttributes:dict];}

@end
