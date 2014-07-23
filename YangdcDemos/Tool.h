//
//  Tool.h
//  AppDemo
//
//  Created by ydc on 14-7-8.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

#import <objc/runtime.h>

@interface Tool : NSObject


+ (NSDate *)dateStartOfWeek:(NSDate *)date;
@end

bool checkOnlineStatus();