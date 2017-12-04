//
//  NumberAnimationVCViewController.m
//  OMUI
//
//  Created by MichaeOu on 2017/12/4.
//  Copyright © 2017年 康美. All rights reserved.
//



#import "NumberAnimationVCViewController.h"
#import "UICountingLabel.h"

@interface NumberAnimationVCViewController ()


@property (nonatomic, strong) UICountingLabel *label;
@end

@implementation NumberAnimationVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UICountingLabel *countingLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(30, 100, 280, 450)];
    countingLabel.textAlignment = NSTextAlignmentCenter;
    countingLabel.textColor = [UIColor cyanColor];
    countingLabel.format = @"%d";
    [self.view addSubview:countingLabel];
    
    [countingLabel countFrom:5 to:10000 withDuration:3];
    
    
    // count up using a string that uses a number formatter
    UICountingLabel* scoreLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 90, 200, 40)];
    [self.view addSubview:scoreLabel];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    scoreLabel.formatBlock = ^NSString* (CGFloat value)
    {
        NSString* formatted = [formatter stringFromNumber:@((int)value)];
        return [NSString stringWithFormat:@"Score: %@",formatted];
    };
    scoreLabel.method = UILabelCountingMethodEaseOut;
    [scoreLabel countFrom:0 to:10000 withDuration:2.5];
    
    // count up with attributed string
    NSInteger toValue = 100;
    UICountingLabel* attributedLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 130, 200, 40)];
    [self.view addSubview:attributedLabel];
    attributedLabel.attributedFormatBlock = ^NSAttributedString* (CGFloat value)
    {
        NSDictionary* normal = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: 20] };
        NSDictionary* highlight = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 20] };
        
        NSString* prefix = [NSString stringWithFormat:@"%d", (int)value];
        NSString* postfix = [NSString stringWithFormat:@"/%d", (int)toValue];
        
        NSMutableAttributedString* prefixAttr = [[NSMutableAttributedString alloc] initWithString: prefix
                                                                                       attributes: highlight];
        NSAttributedString* postfixAttr = [[NSAttributedString alloc] initWithString: postfix
                                                                          attributes: normal];
        [prefixAttr appendAttributedString: postfixAttr];
        
        return prefixAttr;
    };
    [attributedLabel countFrom:0 to:toValue withDuration:2.5];
    
    
    
    
    
    self.label = [[UICountingLabel alloc] initWithFrame:CGRectMake(30, 300, 280, 450)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor orangeColor];
    [self.view addSubview:self.label];
    self.label.method = UILabelCountingMethodEaseInOut;
    self.label.format = @"%d%%";
    __weak NumberAnimationVCViewController* blockSelf = self;
    self.label.completionBlock = ^{
        blockSelf.label.textColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
    };
    [self.label countFrom:0 to:100];
    
}



@end
