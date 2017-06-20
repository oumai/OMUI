//
//  UISegmentedControlVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/6/20.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UISegmentedControlVC.h"

@interface UISegmentedControlVC ()
@property (nonatomic, strong) UISegmentedControl *segmentControl;
@end

@implementation UISegmentedControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.segmentControl];

}

#pragma mark -------------------------------------------------------------------------------------------------UISegmentedControl------------------------------------------------------------

- (UISegmentedControl *)segmentControl
{
    
    if (!_segmentControl) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,
                             [UIFont systemFontOfSize:14], NSFontAttributeName ,
                             [UIColor blueColor],UITextAttributeTextShadowColor ,nil]; //字体边边颜色
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"男",@"女",@"老",@"少",@"7"]];
        //self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBordered;
        _segmentControl.selectedSegmentIndex = 1;
        _segmentControl.layer.cornerRadius = 10;
        _segmentControl.layer.masksToBounds = YES;
        _segmentControl.layer.borderWidth = 1;
        _segmentControl.layer.borderColor = KHexColor(@"#ff8787").CGColor;
        _segmentControl.tintColor = KHexColor(@"#ff8787");      //边框的颜色
        _segmentControl.backgroundColor= KHexColor(@"#ffbfc0"); //背景颜色
        [_segmentControl setTitleTextAttributes:dic forState:UIControlStateSelected];
        [_segmentControl addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
        //[self.segmentControl setEnabled:NO forSegmentAtIndex:1]; //设置索引的那个不能点击
        
        [_segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX).offset(0);
            make.centerY.equalTo(self.view.mas_centerY).offset(0);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];

    }
    return _segmentControl;
    
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
    
    //    self.type = segmentControl.selectedSegmentIndex + 100;
    //
    //    if (self.type == oneCell) {
    //        NSLog(@"one");
    //    }
    //    if (self.type == twoCell) {
    //        NSLog(@"twoCell");
    //    }
    //    if (self.type == threeCell) {
    //        NSLog(@"threeCell");
    //    }
    //    if (self.type == fourCell) {
    //        NSLog(@"fourCell");
    //    }
    //    if (self.type == fiveCell) {
    //        NSLog(@"fiveCell");
    //    }
}
@end
