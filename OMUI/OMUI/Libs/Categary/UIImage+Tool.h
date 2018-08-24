//
//  UIImage+Tool.h
//  QieyouToolKit
//
//  Created by 欧博 on 15/6/10.
//  Copyright (c) 2015年 欧博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

+(UIImage *) createImageWithColor:(UIColor *) color;

@end


@interface UIImage (Compress)
- (UIImage *)compressedImage;
@end
