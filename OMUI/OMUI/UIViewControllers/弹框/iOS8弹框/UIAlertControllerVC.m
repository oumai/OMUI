//
//  UIAlertControllerVC.m
//  OMUI
//
//  Created by MichaeOu on 2017/7/6.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "UIAlertControllerVC.h"

@interface UIAlertControllerVC ()

@end

@implementation UIAlertControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否删除就诊人信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"取消调用的操作");
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"改变");
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];

}

@end
