//
//  HeaderCollectionReusableView.m
//  AiFuGou
//
//  Created by Michael on 16/6/4.
//  Copyright © 2016年 jumper. All rights reserved.
//
#import "HeaderCollectionReusableView.h"

@interface HeaderCollectionReusableView()
@end
@implementation HeaderCollectionReusableView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
      
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        
        
        //东阿新城百货页面  #import "DongaBaiHuoViewController.h"    商品管理页面//#import "ShangpinguanliViewController.h"
        self.headerViewImage = [UIImageView new];
        [self addSubview:_headerViewImage];
        
        
        [_headerViewImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self);
        }];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY).offset(0);
            make.left.equalTo(self.mas_left).offset(10);
            make.width.equalTo(100);
            make.height.equalTo(14);
        }];


        
    }
    return self;
}

@end
