//
//  ViewCollectionCell.m
//  OMUI
//
//  Created by Omichael on 2017/4/7.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "ViewCollectionCell.h"

@interface ViewCollectionCell ()


@end

@implementation ViewCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        self.label = [UILabel new];
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.mas_centerX).offset(0);
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.width.equalTo(110);
            make.height.equalTo(60);
            
        }];
    }
    return self;
}

@end
