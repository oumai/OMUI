//
//  DetailUIVC.m
//  OMUI
//
//  Created by Omichael on 2017/4/1.
//  Copyright © 2017年 康美. All rights reserved.
//
#define LongString @"2016年3月28日，习近平在布拉格拉尼庄园同捷克总统泽曼共同种下一株来自中国的银杏树苗，他们共同为树苗培土、浇水。习近平表示，前人栽树，后人乘凉。银杏树象征友谊长存，寓意中捷友好绵长久远。希望两国始终从战略高度、以长远眼光看待和把握双边关系发展大局，让中捷关系和两国传统友谊像我们共同浇灌的这株树苗一样，不断茁壮成长。"
//数字和字母
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#import "DetailUIVC.h"

@interface DetailUIVC ()<UITextFieldDelegate>

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

@implementation DetailUIVC

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
    /*
     切圆角
     self.iconImage.layer.cornerRadius = 25;
     self.iconImage.layer.masksToBounds = YES;
     self.iconImage.layer.borderWidth = 0.5;
     self.iconImage.layer.borderColor = KHexColor(@"#ff00000").CGColor;
     */
    
}
#pragma mark -------------------------------------------------------------------------------------------------Label------------------------------------------------------------
- (void)ConfigureLabel
{
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = KHexColor(@"#999999");
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.numberOfLines = 10;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = LongString;
    [self.view addSubview:_titleLabel];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(300);
        make.height.equalTo(200);
    }];
    
}
#pragma mark -------------------------------------------------------------------------------------------------TextField------------------------------------------------------------

- (void)ConfigureTextField
{
    

    /**
     设置键盘样式，比如银行取款密码只需要数字，有的输入邮箱需要@等等
     
     UIKeyboardTypeAlphabet和UIKeyboardTypeDefault类似，就是我们平时看到那样，都是字母，然后有个按键可以切换符号
     UIKeyboardTypeASCIICapable好像和上面差不多
     UIKeyboardTypeDecimalPad,UIKeyboardTypeNumberPad都是数字，但前者多了一个“小数点”按键
     UIKeyboardTypeNamePhonePad-貌似正常
     UIKeyboardTypePhonePad-电话键盘，不仅有数字还有*和#的那种
     UIKeyboardTypeNumbersAndPunctuation-只有数字和标点符号
     UIKeyboardTypeTwitter-除了字母还有@和#，这是微博的符号
     UIKeyboardTypeURL-除字母，还有.com按钮，方便输入
     UIKeyboardTypeWebSearch-主要区别在于return键变成了GO键
     注意：如果是最xcode6下的模拟器的话，默认是不调出软键盘的，按CMD+K可以调出，或者在菜单Hardware里地Keyboard里设置

     */
    
    
    //设置键盘外观
    //UIKeyboardAppearanceDark和UIKeyboardAppearanceAlert都是把键盘背景变成半透明灰色区别不明显
    //UIKeyboardAppearanceLight貌似和UIKeyboardAppearanceDefault一样，没啥区别
    
    
    
    self.textField = [UITextField new];
    self.textField.textColor = [UIColor colorForHexString:@"ff0000"];
    self.textField.placeholder = @"textField";
    self.textField.secureTextEntry = YES;                        //加密输入
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;   //边框样式
    self.textField.keyboardType = UIKeyboardTypeWebSearch;       //键盘弹出样式
    self.textField.keyboardAppearance = UIKeyboardAppearanceLight;//设置键盘外观
    [self.view addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [string isEqualToString:filtered];
}
#pragma mark -------------------------------------------------------------------------------------------------ImageView------------------------------------------------------------

- (void)ConfigureUIImageView
{
    
    /*
     UIViewContentModeLeft
     UIViewContentModeScaleAspectFill
     UIViewContentModeScaleAspectFit
     UIViewContentModeScaleToFill
     */
    
    self.iconImage = [UIImageView new];
    self.iconImage.image = [UIImage imageNamed:@"contentMode"];
    self.iconImage.contentMode = UIViewContentModeScaleAspectFill;//自适应。
    [self.view addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(CoreWidth/2);
        make.height.equalTo(CoreHeight/2);
    }];
}
#pragma mark -------------------------------------------------------------------------------------------------View------------------------------------------------------------

- (void)ConfigureView
{
    self.myView = [UIView new];
    [self.view addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];
}
#pragma mark -------------------------------------------------------------------------------------------------Button------------------------------------------------------------
- (void)ConfigureUIButton
{
    
    /*
     能够定义的button类型有以下6种，
     typedef enum {
     UIButtonTypeCustom = 0,          自定义风格
     UIButtonTypeRoundedRect,         圆角矩形
     UIButtonTypeDetailDisclosure,    蓝色小箭头按钮，主要做详细说明用
     UIButtonTypeInfoLight,           亮色感叹号
     UIButtonTypeInfoDark,            暗色感叹号
     UIButtonTypeContactAdd,          十字加号按钮
     } UIButtonType;

     */
    
    
    
    /* forState: 这个参数的作用是定义按钮的文字或图片在何种状态下才会显现
    以下是几种状态
        enum {
            UIControlStateNormal       = 0,         常规状态显现
            UIControlStateHighlighted  = 1 << 0,    高亮状态显现
            UIControlStateDisabled     = 1 << 1,    禁用的状态才会显现
            UIControlStateSelected     = 1 << 2,    选中状态
            UIControlStateApplication  = 0x00FF0000, 当应用程序标志时
            UIControlStateReserved     = 0xFF000000  为内部框架预留，可以不管他
        };
    */
    
    
    /*
     * 默认情况下，当按钮高亮的情况下，图像的颜色会被画深一点，如果这下面的这个属性设置为no，
     * 那么可以去掉这个功能
     button1.adjustsImageWhenHighlighted = NO;

     */
    /*跟上面的情况一样，默认情况下，当按钮禁用的时候，图像会被画得深一点，设置NO可以取消设置
     
     button1.adjustsImageWhenDisabled = NO;

     */
    
    
    
    /* 下面的这个属性设置为yes的状态下，按钮按下会发光
     
     button1.showsTouchWhenHighlighted = YES;

     */
    
    /* 给button添加事件，事件有很多种，我会单独开一篇博文介绍它们，下面这个时间的意思是
     按下按钮，并且手指离开屏幕的时候触发这个事件，跟web中的click事件一样。
     触发了这个事件以后，执行butClick:这个方法，addTarget:self 的意思是说，这个方法在本类中
     也可以传入其他类的指针*/
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; //标题居中
    self.button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);  //距离上左下右
    self.button.titleLabel.font = [UIFont systemFontOfSize:20];
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
    //方法iOS7不再有效
    //self.segmentControl.segmentedControlStyle =    UISegmentedControlStyleBezeled;
    
    //设置索引的那个不能点击
    //[self.segmentControl setEnabled:NO forSegmentAtIndex:1];


    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,       //选中字体的颜色
                         [UIFont systemFontOfSize:20], NSFontAttributeName ,                                                //字体大小(选中字体的大小)
                         [UIColor orangeColor],UITextAttributeTextShadowColor ,nil];                                        //字体边边颜色
    
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"男",@"女",@"老",@"少",@"7"]];
    self.segmentControl.selectedSegmentIndex = 1;
    self.segmentControl.tintColor = [UIColor yellowColor];       //边框的颜色、选中颜色、没有选中的字体颜色
    self.segmentControl.backgroundColor= [UIColor greenColor];   //背景颜色(没有被选中的背景颜色)
    [self.segmentControl setTitleTextAttributes:dic forState:UIControlStateSelected];
    [self.segmentControl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    
    [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.centerY.equalTo(self.view.mas_centerY).offset(0);
        make.width.equalTo(200);
        make.height.equalTo(30);
    }];
    
    
    NSArray *array = [NSArray arrayWithObjects:@"家具",@"灯饰",@"建材",@"装饰", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.frame = CGRectMake(10, 130, self.view.frame.size.width-20, 30);
    //添加一个分段(在指定下标下插入,并设置动画效果)
    UIFont *font = [UIFont systemFontOfSize:12.0f];
    NSDictionary *atributes = [NSDictionary dictionaryWithObjectsAndKeys:  //字体颜色
                               font,NSFontAttributeName, nil]; //字体大小
    [segment setTitleTextAttributes:atributes forState:UIControlStateNormal];
    //[segment insertSegmentWithTitle:@"五金电料" atIndex:2 animated:NO];
    //[segment insertSegmentWithImage:[UIImage imageNamed:@""] atIndex:0 animated:YES];
    //[segment removeSegmentAtIndex:10 animated:YES];
    //添加到视图
    [self.view addSubview:segment];
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
    
   
}
#pragma mark -------------------------------------------------------------------------------------------------UISlider------------------------------------------------------------
- (void)ConfigureUISlider
{
    self.slider = [UISlider new];
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 100;
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
    self.stepper.stepValue = 2;                //点击＋2
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
        make.width.equalTo(40);
        make.height.equalTo(28);
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
