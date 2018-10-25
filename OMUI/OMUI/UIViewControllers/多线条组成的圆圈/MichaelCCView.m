
//
//  MichaelCCView.m
//  Indicator
//
//  Created by kmom on 2018/10/23.
//  Copyright © 2018年 MyCompany. All rights reserved.
//

#define AngleToRadian(x) (M_PI*(x)/180.0) // 把角度转换成弧度


#import "MichaelCCView.h"
@interface MichaelCCView()


@property (nonatomic, assign) CGFloat openAngle; /**< 开口角度 */

@property (nonatomic, strong) CALayer *layer1;

@property (nonatomic, assign) CGPoint circleCenter; /**< 圆心位置 */

@property (nonatomic, assign) NSUInteger outerAnnulusLineCountToShow; /**< 外圆环要显示的线条数 */

@property (nonatomic, assign) CGFloat startAngle; /**< 起始角度，从圆的中垂线下半部半径开始，顺时针计算 */
@property (nonatomic, assign) CGFloat endAngle;   /**< 结束角度 */


@property (nonatomic, assign) CGFloat outerAnnulusAngleEveryLine; /**< 外圆环每条线均分的角度 */
@property (nonatomic, assign) CGFloat innerAnnulusAngleEveryLine; /**< 内圆环每条线均分的角度 */


@property (nonatomic, assign) CGFloat outerAnnulusInnerCircleRadius; /**< 外圆环内圆半径 */
@property (nonatomic, assign) CGFloat innerAnnulusInnerCircleRadius; /**< 内圆环内圆半径 */

@property (nonatomic, assign) CGFloat outerAnnulusRectangleWidht; /**< 外圆环外部矩形的宽，以圆环中最顶端的矩形为准 */
@property (nonatomic, assign) CGFloat outerAnnulusRectangleHeight; /**< 外圆环外部矩形的高，以圆环中最顶端的矩形为准 */

@property (nonatomic, assign) NSUInteger innerAnnulusLineCountToShow; /**< 内圆环要显示的线条数 */


@property (nonatomic, assign) NSUInteger minValue; /**< 最小值 */
@property (nonatomic, assign) NSUInteger maxValue;  /**< 最大值 */

@end
@implementation MichaelCCView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor  lightGrayColor];
        
        [self setupDefaultDataThatIsNotRelatedToFrame];
        
    }
    return self;
}


/// 设置那些与尺寸无关的变量的默认值
- (void)setupDefaultDataThatIsNotRelatedToFrame {
    self.openAngle = 110.0;
    self.outerAnnulusLineCountToShow = 51;
    //self.innerAnnulusValueToShowArray = @[@30, @40, @50, @60];;
    self.minValue = 30;
    self.maxValue = 60;
    
    CGFloat circleCenterX = 100;//self.bounds.size.width / 2; //* ApplyRatio(self.circleCenterX_ratio);
    CGFloat circleCenterY = 100;//self.bounds.size.height/2;//168.5 / 294 * self.bounds.size.height * ApplyRatio(self.circleCenterY_ratio);
    self.circleCenter = CGPointMake(circleCenterX, circleCenterY);
    //self.centerHintLabel.text = @"已关机";
    
    //_enable = YES;
    //_isStop = NO;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self addLayer1];
    
}

- (void)layoutSubviews
{
    self.innerAnnulusLineCountToShow = self.maxValue - self.minValue + 1;
    self.startAngle = 90.0 + self.openAngle / 2.0;
    self.endAngle = 90.0 - self.openAngle / 2.0;
    self.outerAnnulusAngleEveryLine = (360.0 - self.openAngle) / (self.outerAnnulusLineCountToShow - 1);
    NSUInteger space = self.maxValue - self.minValue == 0 ? 1 : self.maxValue - self.minValue;
    self.innerAnnulusAngleEveryLine = (360.0 - self.openAngle) / space;
}

- (void)addLayer1 {
    //━━━━━━━━━━━━━━━━━━━━ layer1：灰色层 ━━━━━━━━━━━━━━━━━━━━
    CALayer *layer1 = [CALayer layer];
    self.layer1 = layer1;
    layer1.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self.layer addSublayer:layer1];
    layer1.backgroundColor = [UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:255.0/255.0].CGColor;
    layer1.mask = [self maskLayerForLayer1];
}

/// layer1 的 maskLayer
- (CAShapeLayer *)maskLayerForLayer1 {
    
    self.outerAnnulusInnerCircleRadius = 95;
    
    self.outerAnnulusRectangleWidht = 2;
    
    self.outerAnnulusRectangleHeight = 5;
    
    CAShapeLayer * maskLayer= [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, self.layer1.bounds.size.width, self.layer1.bounds.size.height);
    
    UIBezierPath *basePath = [UIBezierPath bezierPath];
    
    for (int i = 0; i < self.outerAnnulusLineCountToShow; i++) {
        
        CGFloat angleTemp = self.startAngle + i * self.outerAnnulusAngleEveryLine;
        
        NSArray *rectanglePointArray = [self calculateFourKeyPointForRectangleWithCircleCenter:self.circleCenter innerCircleRadius:self.outerAnnulusInnerCircleRadius rectangleWidht:self.outerAnnulusRectangleWidht rectangleHeight:self.outerAnnulusRectangleHeight angle:angleTemp];
        CGPoint topLeftPoint = ((NSValue *)rectanglePointArray[0]).CGPointValue;
        CGPoint topRightPoint = ((NSValue *)rectanglePointArray[1]).CGPointValue;
        CGPoint bottomRightPoint = ((NSValue *)rectanglePointArray[2]).CGPointValue;
        CGPoint bottomLeftPoint = ((NSValue *)rectanglePointArray[3]).CGPointValue;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:topLeftPoint];
        [path addLineToPoint:topRightPoint];
        [path addLineToPoint:bottomRightPoint];
        [path addLineToPoint:bottomLeftPoint];
        [path closePath];
        
        // 画在当前的 layer
        //        UIColor *strokeColor = [UIColor blackColor];
        //        [strokeColor set];
        //        [path stroke];
        
        [basePath appendPath:path];
    }
    
    maskLayer.path = basePath.CGPath;
    return maskLayer;
}

/**
 计算矩形的四个顶点坐标
 
 @param cirlceCenter 圆心
 @param innerCircleRadius 内圆半径
 @param rectangleWidht 矩形宽
 @param rectangleHeight 矩形高
 @param angle 矩形绕圆心的角度
 @return 数组，包含四个顶点坐标（顺时针，上左，上右，下右，下左）
 */
- (NSArray *)calculateFourKeyPointForRectangleWithCircleCenter:(CGPoint)cirlceCenter innerCircleRadius:(CGFloat)innerCircleRadius rectangleWidht:(CGFloat)rectangleWidht rectangleHeight:(CGFloat)rectangleHeight angle:(CGFloat)angle {
    CGFloat cirlceCenterX = cirlceCenter.x;
    CGFloat cirlceCenterY = cirlceCenter.y;
    
    CGFloat tempAngle = 360 - angle;
    CGFloat tempRadian = AngleToRadian(tempAngle);
    
    CGFloat middlePointX_LeftLine = cirlceCenterX + innerCircleRadius * cos(tempRadian);
    CGFloat middlePointY_LeftLine = cirlceCenterY - innerCircleRadius * sin(tempRadian);
    
    CGFloat topLeftPointX = middlePointX_LeftLine - rectangleWidht / 2 * sin(tempRadian);
    CGFloat topLeftPointY = middlePointY_LeftLine - rectangleWidht / 2 * cos(tempRadian);
    NSValue *topLeftPointValue = [NSValue valueWithCGPoint:CGPointMake(topLeftPointX, topLeftPointY)];
    
    CGFloat topRightPointX = topLeftPointX + rectangleHeight * cos(tempRadian);
    CGFloat topRightPointY = topLeftPointY - rectangleHeight * sin(tempRadian);
    NSValue *topRightPointValue = [NSValue valueWithCGPoint:CGPointMake(topRightPointX, topRightPointY)];
    
    CGFloat bottomLeftPointX = middlePointX_LeftLine + rectangleWidht / 2 * sin(tempRadian);
    CGFloat bottomLeftPointY = middlePointY_LeftLine + rectangleWidht / 2 * cos(tempRadian);
    NSValue *bottomLeftPointValue = [NSValue valueWithCGPoint:CGPointMake(bottomLeftPointX, bottomLeftPointY)];
    
    CGFloat bottomRightPointX = bottomLeftPointX + rectangleHeight * cos(tempRadian);
    CGFloat bottomRightPointY = bottomLeftPointY - rectangleHeight * sin(tempRadian);
    NSValue *bottomRightPointValue = [NSValue valueWithCGPoint:CGPointMake(bottomRightPointX, bottomRightPointY)];
    
    NSArray *pointArray = @[topLeftPointValue, topRightPointValue, bottomRightPointValue, bottomLeftPointValue];
    
    return pointArray;
}
@end
