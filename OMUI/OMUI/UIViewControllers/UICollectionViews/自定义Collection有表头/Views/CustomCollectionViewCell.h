//
//  ShangpinguanliCustomCell.h
//  AiFuGou
//
//  Created by Michael on 16/6/7.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) void(^pushBlock)();

@end
