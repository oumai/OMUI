//
//  OMMeTableViewCell.m
//  OMUI
//
//  Created by MichaeOu on 2018/4/4.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "OMMeTableViewCell.h"

@implementation OMMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellStyleValue1;
        
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).mas_offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.size.mas_offset(CGSizeMake(27, 27));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).mas_offset(10);
            make.bottom.top.equalTo(self.contentView);
        }];
        
     
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = KHexColor(@"#555555");
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;

}
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeCenter;
    }
    return _iconImageView;
}
@end
