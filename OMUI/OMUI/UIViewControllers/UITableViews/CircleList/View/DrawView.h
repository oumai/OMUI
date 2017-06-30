//
//  DrawView.h
//  HealthNutritionManager
//
//  Created by Michael on 16/3/7.
//  Copyright © 2016年 欧博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
@property (nonatomic, assign) CGContextRef context;
@property (nonatomic, strong) NSString *stringLabel;
@property (nonatomic, assign) NSInteger index;
@end
