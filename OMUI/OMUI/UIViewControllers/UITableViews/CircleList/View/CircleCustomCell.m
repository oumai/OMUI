//
//  TianZiGeCustomCell.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/29.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "CircleCustomCell.h"
#import "DrawView.h"
@interface CircleCustomCell()
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *sheRuLiangLabel;
@property (nonatomic, strong) DrawView *morningLabel;
@property (nonatomic, strong) DrawView *morningPlusLabel;
@property (nonatomic, strong) DrawView *noonLabel;
@property (nonatomic, strong) DrawView *noonPlusLabel;
@property (nonatomic, strong) DrawView *eveningLabel;
@property (nonatomic, strong) DrawView *eveningPlusLabel;
@property (nonatomic, strong) UIImageView *arrowImage;


@end
@implementation CircleCustomCell

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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#ebebeb");
        self.cellView = [UIView new];
        self.cellView.backgroundColor = KHexColor(@"#ffffff");
        self.cellView.layer.cornerRadius = 6;
        self.cellView.layer.masksToBounds = YES;
        [self.contentView addSubview:_cellView];
        
        
        self.arrowImage = [UIImageView new];
        self.arrowImage.image = [UIImage imageNamed:@"arrows"];
        [self.contentView addSubview:_arrowImage];
        
        
        self.dateLabel = [UILabel new];
        self.dateLabel.textColor = KHexColor(@"#666666");
        self.dateLabel.font = KFontSize(14);
        [self.cellView addSubview:_dateLabel];
        
        
        self.sheRuLiangLabel = [UILabel new];
        self.sheRuLiangLabel.textColor = KHexColor(@"#666666");
        self.sheRuLiangLabel.font = KFontSize(14);
        [self.cellView addSubview:_sheRuLiangLabel];
        
        
        self.morningLabel = [[DrawView alloc] init];
        self.morningLabel.backgroundColor = [UIColor whiteColor];
        self.morningLabel.stringLabel = @"早";
        self.morningLabel.index = 1;
        [self.cellView addSubview:_morningLabel];
        
        self.morningPlusLabel = [[DrawView alloc] init];
        self.morningPlusLabel.backgroundColor = [UIColor whiteColor];
        self.morningPlusLabel.stringLabel = @"早+";
        self.morningPlusLabel.index = 2;
        [self.cellView addSubview:_morningPlusLabel];
        
        self.noonLabel = [[DrawView alloc] init];
        self.noonLabel.backgroundColor = [UIColor whiteColor];
        self.noonLabel.stringLabel = @"午";
        self.noonLabel.index = 3;
        [self.cellView addSubview:_noonLabel];
        
        
        self.noonPlusLabel = [[DrawView alloc] init];
        self.noonPlusLabel.backgroundColor = [UIColor whiteColor];
        self.noonPlusLabel.stringLabel = @"午+";
        self.noonPlusLabel.index = 4;
        [self.cellView addSubview:_noonPlusLabel];
        
        
        self.eveningLabel = [[DrawView alloc] init];
        self.eveningLabel.backgroundColor = [UIColor whiteColor];
        self.eveningLabel.stringLabel = @"晚";
        self.eveningLabel.index = 5;
        [self.cellView addSubview:_eveningLabel];
        
        
        self.eveningPlusLabel = [[DrawView alloc] init];
        self.eveningPlusLabel.backgroundColor = [UIColor whiteColor];
        self.eveningPlusLabel.stringLabel = @"晚+";
        self.eveningPlusLabel.index = 6;
        [self.cellView addSubview:_eveningPlusLabel];
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.right.equalTo(self.cellView.mas_right).offset(-5);
            make.width.equalTo(7);
            make.height.equalTo(12);
        }];
        
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(8);
            make.left.equalTo(self.cellView.mas_left).offset(8);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(14);
        }];
        [_sheRuLiangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cellView.mas_top).offset(8);
            make.right.equalTo(self.cellView.mas_right).offset(-8);
            make.width.equalTo(self.sheRuLiangLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        
        [_morningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.cellView.mas_left).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
        [_morningPlusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.morningLabel.mas_right).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        [_noonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.morningPlusLabel.mas_right).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        [_noonPlusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.noonLabel.mas_right).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
        [_eveningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.noonPlusLabel.mas_right).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
        [_eveningPlusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.cellView.mas_centerY).offset(10);
            make.left.equalTo(self.eveningLabel.mas_right).offset(8);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
    }
    return self;
}

@end
