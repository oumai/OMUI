//
//  ShangpinguanliCustomCell.m
//  AiFuGou
//
//  Created by Michael on 16/6/7.
//  Copyright © 2016年 jumper. All rights reserved.
//



#import "CustomCollectionViewCell.h"
@interface CustomCollectionViewCell()

@property (nonatomic, strong) UILabel               *titleLabel;
@property (nonatomic, strong) UIView                *bottomView;
@property (nonatomic, strong) UIView                *bottomView2;
@property (nonatomic, strong) TTTAttributedLabel    *priceLabel;
@property (nonatomic, strong) UIImageView           *iconImage;
@property (nonatomic, strong) UIButton              *leftButton;
@property (nonatomic, strong) UIButton              *rightButton;

@end
@implementation CustomCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = KHexColor(@"#ffffff");
        
        self.bottomView2 = [UIView new];
        self.bottomView2.backgroundColor = KHexColor(@"#f2ccc0");
        [self.contentView addSubview:_bottomView2];
        
        
        [_bottomView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.width.equalTo(CoreWidth/2);
            make.height.equalTo(30);
        }];
        
        
        
        self.bottomView = [UIView new];
        self.bottomView.backgroundColor = KHexColor(@"#f2ccc0");
        [self.contentView addSubview:_bottomView];
        
        
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.bottomView2.mas_top).offset(-1);
            make.width.equalTo(CoreWidth/2);
            make.height.equalTo(30);
        }];
        
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.textColor = KHexColor(@"#999999");
        self.titleLabel.text = @"进口樱桃";
        [self.contentView addSubview:_titleLabel];
        
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_iconImage];
        
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(80);
            make.height.equalTo(80);
        }];
        
        
        self.priceLabel = [TTTAttributedLabel new];
        self.priceLabel.font = KFontSize(16);
        self.priceLabel.textColor = [UIColor redColor];
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        self.priceLabel.backgroundColor = KHexColor(@"#f9a98e");
        [self.contentView addSubview:_priceLabel];
        
        
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottomView.mas_bottom).offset(0);
            make.right.equalTo(self.bottomView.mas_right).offset(-30);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }];
        
        [self.priceLabel setText:@"¥  " afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            
            NSAttributedString *yuan = [[NSAttributedString alloc] initWithString:@"135"
                                                                       attributes:@{NSForegroundColorAttributeName : [UIColor redColor],
                                                                                    NSFontAttributeName:KFontSize(12)}];
            [mutableAttributedString appendAttributedString:yuan];
            return mutableAttributedString;
        }];
        
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftButton.tag = 101;
        [self.leftButton setImage:[UIImage imageNamed:@"shangpinguanli_bianji"] forState:UIControlStateNormal];
        [self.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_leftButton];
        
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bottomView2.mas_centerY).offset(0);
            make.centerX.equalTo(self.bottomView2.mas_centerX).offset(-20);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton.tag = 102;
        self.rightButton.titleLabel.font = KFontSize(14);
        [self.rightButton setImage:[UIImage imageNamed:@"shangpinguanli_shanchu"] forState:UIControlStateNormal];
        [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_rightButton];
        
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.bottomView2.mas_centerY).offset(0);
            make.right.equalTo(self.bottomView2.mas_right).offset(-20);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        

    }
    return self;
}
- (void)leftButtonClick:(UIButton *)button
{
    if (self.pushBlock) {
        self.pushBlock();
    }
    
}
- (void)rightButtonClick:(UIButton *)button
{
    
}
@end
