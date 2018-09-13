//
//  CalendarViewController.m
//  OMUI
//
//  Created by kmom on 2018/9/13.
//  Copyright © 2018年 康美. All rights reserved.
/*
 
 https://www.cnblogs.com/kaysun/p/5519222.html
 */

#import "CalendarViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    //日历100年前
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:-100];//设置最小时间为：当前时间前推十年
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    NSLog(@"\nminDate = %@",minDate);
    
    //NSDate *minDate = [fmt dateFromString:@"1930-1-1"];
    //设置日期最大及最小值
    //datePicker.maximumDate = timeDate;
    //datePicker.minimumDate = minDate;
    
    [self layout1];
    [self layout2];
    [self layout3];
   
}
 //1、当前时间减去18年
- (void)layout1
{
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit fromDate:currentDate];
    [dateComponents setYear:-18];
    
    NSDate *newdate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSLog(@"\nminDate = %@",newdate);

}

//2、当前时间减去18年4个月12天
- (void)layout2
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:currentDate];
    [dateComponents setYear:-18];
    [dateComponents setMonth:-4];
    [dateComponents setDay:-12];
    
    NSDate *newdate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSLog(@"\nminDate = %@",newdate);

}


//3、当前时间加上18年4个月12天

- (void)layout3
{
    NSDate *currentDate = currentDate = [NSDate date];
    NSCalendar *calendar = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calendar = [NSCalendar currentCalendar];
    }
    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:currentDate];
    [dateComponents setYear:18];
    [dateComponents setMonth:4];
    [dateComponents setDay:12];
    
    NSDate *newdate = [calendar dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSLog(@"\nminDate = %@",newdate);

}

@end
