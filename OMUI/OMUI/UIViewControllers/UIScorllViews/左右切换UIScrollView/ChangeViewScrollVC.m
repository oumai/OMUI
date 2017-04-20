
//
//  ChangeViewScrollVC.m
//  OMUI
//
//  Created by Omichael on 2017/4/7.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "ChangeViewScrollVC.h"


@interface ChangeViewScrollVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTabelView;
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@property (nonatomic, strong) UIButton *textFieldButton;
@property (nonatomic, strong) UIView    *bgView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextField *textTF;

@end

@implementation ChangeViewScrollVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
     
    }
    return self;
}

- (void)backButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.automaticallyAdjustsScrollViewInsets = NO; //自动调整滚动视图集
    self.dataArray = [NSMutableArray array];
    self.textFieldButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.textFieldButton.frame = CGRectMake(270, 20, 50, 30);
    [self.textFieldButton setTitle:@"弹起" forState:UIControlStateNormal];
    [self.textFieldButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.textFieldButton addTarget:self action:@selector(textFieldButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_textFieldButton];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,
                         [UIFont systemFontOfSize:14], NSFontAttributeName, nil];
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"正在进行中",@"就这样结束"]];
    self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.layer.cornerRadius = 10;
    self.segmentControl.layer.masksToBounds = YES;
    self.segmentControl.layer.borderWidth = 1;
    self.segmentControl.layer.borderColor = KHexColor(@"#ff8787").CGColor;
    self.segmentControl.tintColor = KHexColor(@"#ff8787");      //边框的颜色
    self.segmentControl.backgroundColor= KHexColor(@"#ffbfc0"); //背景颜色
    [self.segmentControl setTitleTextAttributes:dic forState:UIControlStateSelected];
    [self.segmentControl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
    //[self.segmentControl setEnabled:NO forSegmentAtIndex:1]; //设置索引的那个不能点击
    [self.view addSubview:_segmentControl];
    [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.width.equalTo(CoreWidth-100);
        make.height.equalTo(43);
    }];
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 64, CoreWidth, CoreHeight-64);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(CoreWidth*2, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CoreWidth, CoreHeight) style:UITableViewStylePlain];
    self.leftTableView.rowHeight = 45;
    self.leftTableView.dataSource = self;
    [self.scrollView addSubview:_leftTableView];
    
    self.rightTabelView = [[UITableView alloc] initWithFrame:CGRectMake(CoreWidth, 0, CoreWidth, CoreHeight) style:UITableViewStylePlain];
    self.rightTabelView.rowHeight = 80;
    self.rightTabelView.dataSource = self;
    [self.scrollView addSubview:_rightTabelView];
    
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = KHexColor(@"#ffbfc0"); //背景颜色
    self.bgView.frame = CGRectMake(0, CoreHeight-50, CoreWidth, 50);
    [self.view addSubview:_bgView];
    
    self.textField = [[UITextField alloc] init];
    self.textField.returnKeyType = UIReturnKeySend;
    self.textField.enablesReturnKeyAutomatically = YES;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    [self.bgView addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView.mas_centerX).offset(0);
        make.centerY.equalTo(self.bgView.mas_centerY).offset(0);
        make.width.equalTo(310);
        make.height.equalTo(40);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardTan:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
- (void)segmentControlClick:(UISegmentedControl *)seg
{
    self.index = seg.selectedSegmentIndex;
    NSLog(@"index = %ld",self.index);
    [_scrollView setContentOffset:CGPointMake(CoreWidth*(self.index), 0) animated:YES];
}
- (void)textFieldButtonClick
{
    [_textField becomeFirstResponder];
    
}
- (void)keyBoardTan:(NSNotification *)noti
{
    NSValue *value = [noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [value CGRectValue];
    self.bgView.frame = CGRectMake(0, rect.origin.y-60, CoreWidth, 60);
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_dataArray addObject:_textField.text];
    [_leftTableView reloadData];
    [_leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[_dataArray count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    return YES;
}

#pragma mark ------------------------------------------------------------------UIScrollView Delegate-------------------------------------------------
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.segmentControl.selectedSegmentIndex = _scrollView.contentOffset.x/CoreWidth;
}


#pragma mark ------------------------------------------------------------------UITableViewDatasource Delegate-------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTableView) {
        return [_dataArray count];
    }
    else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTableView) {
        static NSString *leftID = @"left";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftID];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftID];
        }
        cell.textLabel.text = _dataArray[indexPath.row];
        //        CGRect rect = [cell.textLabel.text boundingRectWithSize:CGSizeMake(170, 0)
        //                                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
        //                                                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
        //                                                           context:nil];
        //        NSLog(@"rect == %f",rect);
        //        cell.textLabel.frame = CGRectMake(320-rect.size.width-90, 15, rect.size.width, rect.size.height);
        
        return cell;
    }
    else
    {
        static NSString *rightID = @"right";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightID];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rightID];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }
}
@end
