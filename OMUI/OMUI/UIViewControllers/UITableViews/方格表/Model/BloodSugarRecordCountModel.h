//
//  BloodSugarRecordCountModel.h
//  AngelSound
//
//  Created by Michael on 16/8/12.
//  Copyright © 2016年 Jumper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BloodSugarRecordCountModel : NSObject

@property (nonatomic, strong) NSString *high;
@property (nonatomic, strong) NSString *hight_rate;
@property (nonatomic, strong) NSString *low;
@property (nonatomic, strong) NSString *low_rate;
@property (nonatomic, strong) NSString *normal;
@property (nonatomic, strong) NSString *standard_rate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *total;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
