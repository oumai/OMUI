//
//  GestureVC.h
//  OMUI
//
//  Created by Omichael on 2017/4/21.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMGestureRecognizer.h"

@interface GestureVC : UIViewController


- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer;
- (void)handleTap:(UITapGestureRecognizer *)recognizer;
- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer;
- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer;
- (void)handleCustomGestureRecognizer:(KMGestureRecognizer *)recognizer;

- (void)bindPan:(UIImageView *)imgVCustom;
- (void)bindPinch:(UIImageView *)imgVCustom;
- (void)bindRotation:(UIImageView *)imgVCustom;
- (void)bindTap:(UIImageView *)imgVCustom;
- (void)bindLongPress:(UIImageView *)imgVCustom;
- (void)bindSwipe;
- (void)bingCustomGestureRecognizer;
- (void)configureUI;
@end
