//
//  CircleLinesViewController.m
//  OMUI
//
//  Created by kmom on 2018/10/25.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "CircleLinesViewController.h"
#import "MichaelCCView.h"

@interface CircleLinesViewController ()
@property (nonatomic, strong) MichaelCCView *ccView;

@end

@implementation CircleLinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MichaelCCView *ccv = [MichaelCCView new];
    ccv.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:ccv];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
