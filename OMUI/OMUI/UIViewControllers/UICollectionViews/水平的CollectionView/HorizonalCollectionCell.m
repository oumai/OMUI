//
//  HorizonalCollectionCell.m
//  OMUI
//
//  Created by Omichael on 2017/4/6.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "HorizonalCollectionCell.h"

@interface HorizonalCollectionCell ()
@property (nonatomic, strong) TTTAttributedLabel *xueYaLabel;
@property (nonatomic, strong) TTTAttributedLabel *xueYaTitleLabel;
@property (nonatomic, strong) UIView *line;
@end

@implementation HorizonalCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor grayColor];
        
        self.xueYaTitleLabel = [TTTAttributedLabel new];
        self.xueYaTitleLabel.textColor = KHexColor(@"#9f9f9f");
        self.xueYaTitleLabel.font = KFontSize(12);
        self.xueYaTitleLabel.text = [NSString stringWithFormat:@"收缩压"];
        [self.contentView addSubview:_xueYaTitleLabel];
        
        
        
        self.xueYaLabel = [TTTAttributedLabel new];
        self.xueYaLabel.textColor = KHexColor(@"#fe6374");
        self.xueYaLabel.font = KFontSize(40);
        self.xueYaLabel.text = @"130";
        [self.contentView addSubview:_xueYaLabel];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#dbdbdb");
        [self.contentView addSubview:_line];
        
        [_xueYaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-15);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.xueYaLabel.mas_width);
            make.height.equalTo(40);
        }];
        
        
        [_xueYaTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xueYaLabel.mas_bottom).offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.xueYaTitleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.width.equalTo(0.5);
            make.height.equalTo(CoreWidth/4.5);
        }];
        
    }
    return self;
}


@end
