//
//  BloodSugarRecordCustomCell.m
//  BloodPressure
//
//  Created by Michael on 16/4/26.
//  Copyright © 2016年 jumper. All rights reserved.
//

#define GeZiHeight CoreWidth*3/8/4
#define GeZiWidth  CoreWidth/8


#import "BloodSugarRecordCustomCell.h"
#import "BloodSugarRecordGeZiView.h"
#import "XieXianView.h"
@interface BloodSugarRecordCustomCell()
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *earlyBeforeLabel;
@property (nonatomic, strong) UILabel *earlyBehindLabel;
@property (nonatomic, strong) UILabel *noonBeforeLabel;
@property (nonatomic, strong) UILabel *noonBehindLabel;
@property (nonatomic, strong) UILabel *evenimgBeforeLabel;
@property (nonatomic, strong) UILabel *evenimgBehindLabel;
@property (nonatomic, strong) UILabel *sleepBeforeLabel;

@property (nonatomic, strong) XieXianView *xieXian;
@property (nonatomic, strong) XieXianView *xieXian1;
@property (nonatomic, strong) XieXianView *xieXian2;
@property (nonatomic, strong) XieXianView *xieXian3;
@property (nonatomic, strong) XieXianView *xieXian4;
@property (nonatomic, strong) XieXianView *xieXian5;
@property (nonatomic, strong) XieXianView *xieXian6;
@property (nonatomic, strong) BloodSugarRecordGeZiView *geZiView;

@end
@implementation BloodSugarRecordCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.geZiView = [BloodSugarRecordGeZiView new];
        self.geZiView.backgroundColor = KHexColor(@"#ffffff");
        [self.contentView addSubview:_geZiView];
        
      
        self.dateLabel = [UILabel new];
        self.dateLabel.font = KFontSize(12);
        self.dateLabel.textColor = KHexColor(@"#999999");
        self.dateLabel.text = [NSString stringWithFormat:@"2-12"];
        [self.contentView addSubview:_dateLabel];
        
     
        
        self.earlyBeforeLabel = [UILabel new];
        self.earlyBeforeLabel.font = KFontSize(12);
        self.earlyBeforeLabel.textColor = KHexColor(@"#666666");
        self.earlyBeforeLabel.text = [NSString stringWithFormat:@"5.8"];
        [self.contentView addSubview:_earlyBeforeLabel];
        
             
        self.earlyBehindLabel = [UILabel new];
        self.earlyBehindLabel.font = KFontSize(12);
        self.earlyBehindLabel.textColor = KHexColor(@"#666666");
        self.earlyBehindLabel.text = [NSString stringWithFormat:@"5.7"];
        [self.contentView addSubview:_earlyBehindLabel];
        
        
        self.noonBeforeLabel = [UILabel new];
        self.noonBeforeLabel.font = KFontSize(12);
        self.noonBeforeLabel.textColor = KHexColor(@"#666666");
        self.noonBeforeLabel.text = [NSString stringWithFormat:@"5.6"];
        [self.contentView addSubview:_noonBeforeLabel];
        
     
        self.noonBehindLabel = [UILabel new];
        self.noonBehindLabel.font = KFontSize(12);
        self.noonBehindLabel.textColor = KHexColor(@"#666666");
        self.noonBehindLabel.text = [NSString stringWithFormat:@"5.5"];
        [self.contentView addSubview:_noonBehindLabel];
        
        
        self.evenimgBeforeLabel = [UILabel new];
        self.evenimgBeforeLabel.font = KFontSize(12);
        self.evenimgBeforeLabel.textColor = KHexColor(@"#666666");
        self.evenimgBeforeLabel.text = [NSString stringWithFormat:@"5.4"];
        [self.contentView addSubview:_evenimgBeforeLabel];
        
     
        
        self.evenimgBehindLabel = [UILabel new];
        self.evenimgBehindLabel.font = KFontSize(12);
        self.evenimgBehindLabel.textColor = KHexColor(@"#666666");
        self.evenimgBehindLabel.text = [NSString stringWithFormat:@"5.3"];
        [self.contentView addSubview:_evenimgBehindLabel];
        
        
        
        
        self.sleepBeforeLabel = [UILabel new];
        self.sleepBeforeLabel.font = KFontSize(12);
        self.sleepBeforeLabel.textColor = KHexColor(@"#666666");
        self.sleepBeforeLabel.text = [NSString stringWithFormat:@"5.2"];
        [self.contentView addSubview:_sleepBeforeLabel];
        
        [_geZiView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.contentView);
        }];
        
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(1*CoreWidth/16);
            make.width.equalTo(self.dateLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_earlyBeforeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(3*CoreWidth/16);
            make.width.equalTo(self.earlyBeforeLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        
        [_earlyBehindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(5*CoreWidth/16);
            make.width.equalTo(self.earlyBehindLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_noonBeforeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(7*CoreWidth/16);
            make.width.equalTo(self.noonBeforeLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_noonBehindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(9*CoreWidth/16);
            make.width.equalTo(self.noonBehindLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_evenimgBeforeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(11*CoreWidth/16);
            make.width.equalTo(self.evenimgBeforeLabel.mas_width);
            make.height.equalTo(12);
        }];
        
        [_evenimgBehindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(13*CoreWidth/16);
            make.width.equalTo(self.evenimgBehindLabel.mas_width);
            make.height.equalTo(12);
        }];

        [_sleepBeforeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_left).offset(15*CoreWidth/16);
            make.width.equalTo(self.sleepBeforeLabel.mas_width);
            make.height.equalTo(12);
        }];
        
      
    }
    return self;
}
@end
