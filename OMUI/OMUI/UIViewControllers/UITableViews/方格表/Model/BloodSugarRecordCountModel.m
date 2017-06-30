//
//  BloodSugarRecordCountModel.m
//  AngelSound
//
//  Created by Michael on 16/8/12.
//  Copyright © 2016年 Jumper. All rights reserved.
//

#import "BloodSugarRecordCountModel.h"


@interface BloodSugarRecordCountModel()

@end


@implementation BloodSugarRecordCountModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        
        if ([dic objectForKey:@"title"]) {
            self.title = [dic objectForKey:@"title"];
        }
        if ([[dic objectForKey:@"high"] isKindOfClass:[NSNumber class]]) {
            self.high = [[dic objectForKey:@"high"] stringValue];
        }
        if ([[dic objectForKey:@"hight_rate"] isKindOfClass:[NSNumber class]]) {
            self.hight_rate = [[dic objectForKey:@"hight_rate"] stringValue];
        }
        if ([[dic objectForKey:@"low"] isKindOfClass:[NSNumber class]]) {
            self.low = [[dic objectForKey:@"low"] stringValue];
        }
        if ([[dic objectForKey:@"low_rate"] isKindOfClass:[NSNumber class]]) {
            self.low_rate = [[dic objectForKey:@"low_rate"] stringValue];
        }
        if ([[dic objectForKey:@"normal"] isKindOfClass:[NSNumber class]]) {
            self.normal = [[dic objectForKey:@"normal"] stringValue];
        }
        if ([[dic objectForKey:@"standard_rate"] isKindOfClass:[NSNumber class]]) {
            self.standard_rate = [[dic objectForKey:@"standard_rate"] stringValue];
            
            NSLog(@"self.standard_rate = %@",self.standard_rate);

        }
        if ([[dic objectForKey:@"total"] isKindOfClass:[NSNumber class]]) {
            self.total = [[dic objectForKey:@"total"] stringValue];
        }
        
    }
    return self;
}
@end
