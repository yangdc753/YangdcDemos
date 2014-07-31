//
//  KMP.m
//  YangdcDemos
//
//  Created by ydc on 14-7-23.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "KMP.h"

@implementation KMP

+(char)string:(NSString *)str indexOf:(NSInteger)index{
    if (index >= str.length) {
        return '\0';
    }
    return [str characterAtIndex:index];
}

@end
