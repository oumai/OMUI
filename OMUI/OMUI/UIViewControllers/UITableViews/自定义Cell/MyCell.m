
//
//  MyCell.m
//  OMUI
//
//  Created by Omichael on 2017/4/6.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

@property (nonatomic, assign)  double proValue;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) TTTAttributedLabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UIButton *button;


@end

@implementation MyCell

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
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self configureCellView];
        [self configureContentView];
    }
    return self;
}
#pragma mark -------------------------------------------------------------------------------------------------configureContentView------------------------------------------------------------
- (void)configureContentView
{
    self.label = [TTTAttributedLabel new];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textColor = KHexColor(@"#999999");
    self.label.text = @"label";
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(self.label.mas_width);
        make.height.equalTo(14);
        make.width.equalTo(100);
    }];
    
    
    self.textField = [UITextField new];
    self.textField.textColor = KHexColor(@"ff0000");
    self.textField.placeholder = @"textField";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.contentView addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    
    self.iconImage = [UIImageView new];
    self.iconImage.image = [UIImage imageNamed:@"iconImage"];
    self.iconImage.layer.cornerRadius = 25;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.borderWidth = 0.5;
    self.iconImage.layer.borderColor = KHexColor(@"#ff00000").CGColor;
    [self.contentView addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = KHexColor(@"#ebebeb");
    [self.contentView addSubview:_lineView];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
}


#pragma mark -------------------------------------------------------------------------------------------------configureCellView------------------------------------------------------------
- (void)configureCellView
{
    self.cellView = [UIView new];
    self.cellView.layer.cornerRadius = 8;
    self.cellView.layer.masksToBounds = YES;
    self.cellView.backgroundColor = KHexColor(@"#ffffff");
    [self.contentView addSubview:_cellView];
    
    
    [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_top).offset(7);
        make.left.equalTo(self.cellView.mas_left).offset(7);
        make.bottom.equalTo(self.cellView.mas_bottom).offset(0);
        make.right.equalTo(self.cellView.mas_right).offset(-7);
        
    }];
    
    
    self.label = [TTTAttributedLabel new];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textColor = KHexColor(@"#999999");
    self.label.text = @"label";
    [self.cellView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_top).offset(10);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(self.label.mas_width);
        make.height.equalTo(14);
        make.width.equalTo(100);
    }];
    
    
    self.textField = [UITextField new];
    self.textField.textColor = KHexColor(@"ff0000");
    self.textField.placeholder = @"textField";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.cellView addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.cellView.mas_left).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    
    self.iconImage = [UIImageView new];
    self.iconImage.image = [UIImage imageNamed:@"iconImage"];
    self.iconImage.layer.cornerRadius = 25;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.borderWidth = 0.5;
    self.iconImage.layer.borderColor = KHexColor(@"#ff00000").CGColor;
    [self.cellView addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cellView.mas_top).offset(15);
        make.right.equalTo(self.cellView.mas_right).offset(-20);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = KHexColor(@"#ebebeb");
    [self.cellView addSubview:_lineView];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cellView.mas_centerX).offset(0);
        make.centerY.equalTo(self.cellView.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];

}

@end
