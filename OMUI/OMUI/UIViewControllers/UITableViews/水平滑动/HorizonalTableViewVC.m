//
//  BasicVC.m
//  CellDemo
//
//  Created by Michael on 16/1/25.
//  Copyright © 2016年 jumper. All rights reserved.
//
/*-----------------------------------------------------------------------------V----------------------------------------------------------------------------*/
@interface HorizonalTableViewCustomCell : UITableViewCell

@end


@interface HorizonalTableViewCustomCell ()
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) TTTAttributedLabel *titleLabel;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;
@property (nonatomic, strong) TTTAttributedLabel *timeLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@end

@implementation HorizonalTableViewCustomCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.frame = CGRectMake(0, 0, CoreWidth, CoreWidth);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor grayColor];
        self.iconImage = [UIImageView new];
        self.iconImage.image = [UIImage imageNamed:@"iconImage"];
        self.iconImage.layer.cornerRadius = 25;
        self.iconImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconImage];
        
        
        self.titleLabel = [TTTAttributedLabel new];
        self.titleLabel.textColor = KHexColor(@"#333333");
        self.titleLabel.font = KFontSize(14);
        self.titleLabel.text = @"Michael Jackson";
        [self.contentView addSubview:_titleLabel];
        
        
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = KHexColor(@"#666666");
        self.detailLabel.font = KFontSize(12);
        self.detailLabel.text = @"niubility";
        [self.contentView addSubview:_detailLabel];
        
        self.timeLabel = [TTTAttributedLabel new];
        self.timeLabel.textColor = KHexColor(@"#999999");
        self.timeLabel.font = KFontSize(10);
        self.timeLabel.text = @"18:00";
        [self.contentView addSubview:_timeLabel];
        
        
        self.line = [UIView new];
        self.line.backgroundColor = KHexColor(@"#999999");
        [self.contentView addSubview:_line];
        
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            //            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(-50);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImage.mas_top).offset(8);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
            make.left.equalTo(self.iconImage.mas_right).offset(10);
            make.width.equalTo(self.titleLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel.mas_centerY).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(self.timeLabel.mas_width);
            make.height.equalTo(14);
        }];
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}
@end




/*------------------------------------------------------------------------------C----------------------------------------------------------------------------*/
#import "HorizonalTableViewVC.h"
@interface HorizonalTableViewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end


@implementation HorizonalTableViewVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, CoreWidth , CoreHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = CoreHeight;
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.pagingEnabled = YES;
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"basicCell";
    HorizonalTableViewCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[HorizonalTableViewCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    return cell;
    
}
@end
