//
//  SettingModel.h
//  OMUI
//
//  Created by MichaeOu on 2017/6/13.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject

@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL line;
@property (nonatomic, strong) Class cls;
@end
