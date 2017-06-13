//
//  UserInterfaceVC.m
//  OMUI
//
//  Created by Omichael on 2017/3/31.
//  Copyright © 2017年 康美. All rights reserved.
//
#import "UserInterfaceVC.h"


@interface UserInterfaceVC ()

@property (nonatomic, strong) UILabel               *titleLabel;    //0
@property (nonatomic, strong) UITextField           *textField;     //1
@property (nonatomic, strong) UIButton              *button;        //2
@property (nonatomic, strong) UIImageView           *iconImage;     //3
@property (nonatomic, strong) UIView                *myView;        //4
@property (nonatomic, strong) UISegmentedControl    *segmentControl;//5
@property (nonatomic, strong) UISlider              *slider;        //6滑动
@property (nonatomic, strong) UIStepper             *stepper;       //7加减
@property (nonatomic, strong) UIProgressView        *progressView;  //8进度条
@property (nonatomic, strong) UISwitch              *switchOn;      //9开关
@end

@implementation UserInterfaceVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.typeui = 1;
    
    if (self.typeui == 0) {
        
        [self ConfigureLabel];
        self.title = [NSString stringWithFormat:@"%@",@"Label"];
    }
    else if (self.typeui == 1)
    {
        [self ConfigureTextField];
        self.title = [NSString stringWithFormat:@"%@",@"TF"];

    }
    else if (self.typeui == 2)
    {
        [self ConfigureUIButton];
        self.title = [NSString stringWithFormat:@"%@",@"UIButton"];

    }
    else if (self.typeui == 3)
    {
        [self ConfigureUIImageView];
        self.title = [NSString stringWithFormat:@"%@",@"UIImageView"];

    }
    else if (self.typeui == 4)
    {
        [self ConfigureView];
        self.title = [NSString stringWithFormat:@"%@",@"View"];

    }
    else if (self.typeui == 5)
    {
        [self ConfigureUISegmentControl];
        self.title = [NSString stringWithFormat:@"%@",@"SegmentControl"];

    }
    else if (self.typeui == 6)
    {
        [self ConfigureUISlider];
        self.title = [NSString stringWithFormat:@"%@",@"Slider"];

    }
    else if (self.typeui == 7)
    {
        [self ConfigureUIStepper];
        self.title = [NSString stringWithFormat:@"%@",@"Stepper"];

    }
    else if (self.typeui == 8)
    {
        [self ConfigureUIProgressView];
        self.title = [NSString stringWithFormat:@"%@",@"Progress"];

    }
    else if (self.typeui == 9)
    {
        [self ConfigureUISwitch];
        self.title = [NSString stringWithFormat:@"%@",@"Switch"];

    }
    
}
#pragma mark -------------------------------------------------------------------------------------------------UILabel------------------------------------------------------------
- (void)ConfigureLabel
{
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = KHexColor(@"#999999");
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.text = @"titleLabel";
    [self.view addSubview:_titleLabel];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(self.titleLabel.mas_width);
        make.height.equalTo(14);
    }];
    
}
#pragma mark -------------------------------------------------------------------------------------------------UITextField------------------------------------------------------------

- (void)ConfigureTextField
{
    self.textField = [UITextField new];
    self.textField.textColor = KHexColor(@"ff0000");
    self.textField.placeholder = @"textField";
    self.textField.backgroundColor = [UIColor lightGrayColor];
    //self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
}
#pragma mark -------------------------------------------------------------------------------------------------UIImageView------------------------------------------------------------

- (void)ConfigureUIImageView
{
    self.iconImage = [UIImageView new];
    self.iconImage.image = [UIImage imageNamed:@"contentMode"];
    self.iconImage.layer.cornerRadius = 25;
    self.iconImage.layer.masksToBounds = YES;
    self.iconImage.layer.borderWidth = 0.5;
    self.iconImage.layer.borderColor = KHexColor(@"#ff00000").CGColor;
    [self.view addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
}
#pragma mark -------------------------------------------------------------------------------------------------UIView------------------------------------------------------------

- (void)ConfigureView
{
    self.myView = [UIView new];
    self.myView.backgroundColor = KHexColor(@"#ebebeb");
    [self.view addSubview:_myView];
    
    [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
}
#pragma mark -------------------------------------------------------------------------------------------------Button------------------------------------------------------------
- (void)ConfigureUIButton
{
    
//    self.button.layer.cornerRadius = 10;
//    self.button.layer.masksToBounds = YES;
//    self.button.layer.borderWidth = 1;
//    self.button.layer.borderColor = KHexColor(@"#ff8787").CGColor;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.button setTitle:@"button" forState:UIControlStateNormal];
    [self.button setTitleColor:KHexColor(@"#000000") forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage createImageWithColor:KHexColor(@"#ebebeb")] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
}
- (void)buttonClick:(UIButton *)button
{
    
    NSArray *array = [NSArray arrayWithObjects:@"家具",@"灯饰",@"建材",@"装饰", nil];
    //初始化UISegmentedControl
    UISegmentedControl *sortListSeg = [[UISegmentedControl alloc]initWithItems:array];
    sortListSeg.frame = CGRectMake(10, 130, self.view.frame.size.width-20, 30);

    UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:NSFontAttributeName];
    [sortListSeg setTitleTextAttributes:attributes
                               forState:UIControlStateNormal];
    UIColor *greenColor = [UIColor greenColor];
    NSDictionary *colorAttr = [NSDictionary dictionaryWithObject:greenColor forKey:NSForegroundColorAttributeName];
    [sortListSeg setTitleTextAttributes:colorAttr forState:UIControlStateNormal];
    [self.view addSubview:sortListSeg];
}
#pragma mark -------------------------------------------------------------------------------------------------UISegmentedControl------------------------------------------------------------

- (void)ConfigureUISegmentControl
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,
                         [UIFont systemFontOfSize:14], NSFontAttributeName ,
                         [UIColor blueColor],UITextAttributeTextShadowColor ,nil]; //字体边边颜色
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"男",@"女",@"老",@"少",@"7"]];
    //self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
    self.segmentControl.selectedSegmentIndex = 1;
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
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(30);
    }];
    
    
//    //先生成存放标题的数据
//    NSArray *array = [NSArray arrayWithObjects:@"家具",@"灯饰",@"建材",@"装饰", nil];
//    //初始化UISegmentedControl
//    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
//    segment.frame = CGRectMake(10, 130, self.view.frame.size.width-20, 30);
//
//    //添加一个分段(在指定下标下插入,并设置动画效果)
//    UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
//    NSDictionary *atributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,[UIColor blueColor],NSShadowAttributeName,font,NSFontAttributeName, nil];//[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]; //字体大小
//    [segment setTitleTextAttributes:atributes forState:UIControlStateNormal];
//    //[segment insertSegmentWithTitle:@"五金电料" atIndex:2 animated:NO];
//    //[segment insertSegmentWithImage:[UIImage imageNamed:@""] atIndex:0 animated:YES];
//    //[segment removeSegmentAtIndex:10 animated:YES];
//    //添加到视图
//    [self.view addSubview:segment];
}

- (void)segmentControlClick:(UISegmentedControl *)segmentControl
{
    NSInteger index = segmentControl.selectedSegmentIndex;
    switch (index) {
        case 0:
            
            break;
        case 1:
            
            break;
        default:
            break;
    }
    
    self.type = segmentControl.selectedSegmentIndex + 100;
    
    if (self.type == oneCell) {
        NSLog(@"one");
    }
    if (self.type == twoCell) {
        NSLog(@"twoCell");
    }
    if (self.type == threeCell) {
        NSLog(@"threeCell");
    }
    if (self.type == fourCell) {
        NSLog(@"fourCell");
    }
    if (self.type == fiveCell) {
        NSLog(@"fiveCell");
    }
}
#pragma mark -------------------------------------------------------------------------------------------------UISlider------------------------------------------------------------
- (void)ConfigureUISlider
{
    self.slider = [UISlider new];
    //self.slider.minimumValue = 0;
    //self.slider.maximumValue = 100;
    self.slider.value = 0.5;
    self.slider.backgroundColor = [UIColor whiteColor];
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
    [self.slider addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(20);
    }];

}
- (void)sliderClick:(UISlider *)slider
{
    float floa = slider.value;
    self.view.alpha = floa;
    NSLog(@"floa = %f",floa);
}


#pragma mark -------------------------------------------------------------------------------------------------UIStepper------------------------------------------------------------

- (void)ConfigureUIStepper
{
    self.stepper = [UIStepper new];            //加减
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = 20;
    self.stepper.stepValue = 2;  //点击＋2
    self.stepper.value = 3;
    [self.stepper addTarget:self action:@selector(stepperClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    
    [_stepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(20);
    }];
    
}
- (void)stepperClick:(UIStepper *)stepper
{
    NSInteger index = stepper.value;
    NSLog(@"index = %ld",index);
}

#pragma mark -------------------------------------------------------------------------------------------------UIProgressView------------------------------------------------------------
- (void)ConfigureUIProgressView
{
    self.progressView = [UIProgressView new];   //进度条
    self.progressView.progress = 0.2;
    self.progressView.layer.cornerRadius = 3;
    self.progressView.layer.masksToBounds = YES;
    self.progressView.tintColor = KHexColor(@"#f08491");
    self.progressView.trackTintColor = KHexColor(@"#c5c5c5");
    [self.progressView setProgressViewStyle:(UIProgressViewStyleDefault)];
    [self.view addSubview:_progressView];
    
    
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    

}
#pragma mark -------------------------------------------------------------------------------------------------UISwitch------------------------------------------------------------
- (void)ConfigureUISwitch
{
    self.switchOn = [UISwitch new];
    self.switchOn.on = YES;
    self.switchOn.onTintColor = [UIColor redColor];
    self.switchOn.tintColor = [UIColor blueColor];
    self.switchOn.thumbTintColor = [UIColor yellowColor];
    [self.switchOn addTarget:self action:@selector(switchOnClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switchOn];
    
    /*        
     1、onTintColor设置开启颜色；
     2、onImage设置开启图片；
     3、tintColor设置正常关闭颜色；
     4、offImage设置关闭图片；
     5、thumbTintColor设置圆形按钮颜色；
     */
    
    [_switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(51);
        make.height.equalTo(31);
    }];
    
}
- (void)switchOnClick:(id)sender
{
    UISwitch *switc = (UISwitch *)sender;
    BOOL isButtonOn = [switc isOn];
    if (isButtonOn) {
        NSLog(@"是");
    }
    else
    {
        NSLog(@"否");
    }
}
@end
