//
//  SettingCell.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/13.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell ()


@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIImageView *arrow;

@end



@implementation SettingCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        
        self.icon = [UIImageView new];
        [self.contentView addSubview:_icon];
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#555555");
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_titleLabel];
        
        UIView *line = [UIView new];
        line.backgroundColor = KHexColor(@"#e6e6e6");
        [self.contentView addSubview:line];
        
        self.arrow = [UIImageView new];
        [self.contentView addSubview:_arrow];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(22);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.width.equalTo(26.0f);
            make.height.equalTo(26.0f);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).offset(15.0f);
            make.centerY.equalTo(self.icon.mas_centerY).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14.0f);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.height.equalTo(.5f);
        }];
        
        [_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-8);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.width.equalTo(44);
            make.height.equalTo(44);
        }];
    }
    return self;
}

- (void)setInfoObj:(SettingModel *)infoObj {
    
    if (nil == infoObj) {
        return;
    }
    
    self.icon.image = [UIImage imageNamed:infoObj.iconName];
    self.titleLabel.text = infoObj.title;
    self.line.hidden = infoObj.line;
    self.arrow.image = [UIImage imageNamed:@"more_btn_view"];
}

@end
