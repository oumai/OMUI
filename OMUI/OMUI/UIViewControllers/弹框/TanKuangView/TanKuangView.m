//
//  TanKuangView.m
//  YiFu
//
//  Created by Michael on 16/3/9.
//  Copyright © 2016年 jumper. All rights reserved.
//

#import "Masonry.h"
/*-----------------------------------------------------------------------------M----------------------------------------------------------------------------*/
@interface TanKuangModel  : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface TanKuangModel ()

@end


@implementation TanKuangModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
    }
    return self;
}
@end





/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface TanKuangCustomCell : UITableViewCell
@end


@interface TanKuangCustomCell ()
@property (nonatomic, strong) TTTAttributedLabel    *titleLabel;
@property (nonatomic, strong) UIView                *cellView;
@end


@implementation TanKuangCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = KHexColor(@"#ebebeb");
        
        
        
        self.cellView = [UIView new];
        self.cellView.layer.borderColor = LineColor.CGColor;
        self.cellView.layer.borderWidth = 0.5;
        self.cellView.backgroundColor = KHexColor(@"#ebebeb");
        [self.contentView addSubview:_cellView];
        
        
        [_cellView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(0);
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            
        }];

        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = DeepColor;
        self.titleLabel.font = KFontSize(14);
        [self.contentView addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
    }
    return self;
}
@end

/*-----------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "TanKuangView.h"
@interface TanKuangView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end


@implementation TanKuangView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTouch)];
        [self addGestureRecognizer:tap];

        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.scrollEnabled = NO;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(64);
            make.right.equalTo(self.mas_right).offset(0);
            make.width.equalTo(100);
            make.height.equalTo(160);


        }];
        
        
    }
    return self;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tanCell";
    TanKuangCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[TanKuangCustomCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    NSArray *array = @[@"高级会员",@"中级会员",@"初级会员",@"会员"];
    cell.titleLabel.text = array[indexPath.row];
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.tankuangDismissBlock) {
        self.tankuangDismissBlock(indexPath.row);
    }
}

- (void)animationPresent
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    self.frame = CGRectMake(0, 0, CoreWidth, CoreHeight);
    [UIView commitAnimations];

}
- (void)animationedDismiss
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    self.frame = CGRectMake(0, -CoreHeight, CoreWidth, CoreHeight);
    [UIView commitAnimations];

}
- (void)tapTouch
{
    [self animationedDismiss];
}

@end
