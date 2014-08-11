//
//  STAppUpdate.m
//  STQuickKit
//
//  Created by yls on 13-11-11.
// Copyright (c) 2013 yls. All rights reserved.
//
// Version 1.0
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "STAppUpdate.h"
#import <UIKit/UIKit.h>

@implementation STAppUpdate

+ (BOOL)hasNewVersion:(NSString *)newVersion {
    // 当前版本
    NSString *curVersion = [self versionOfLocal];
    NSRange range;
    NSArray *curVerArr = nil;
    if ((range = [curVersion rangeOfString:@"."]).location != NSNotFound) {
        curVerArr = [curVersion componentsSeparatedByString:@"."];
    } else {
        curVerArr = [[NSArray alloc] initWithObjects:curVersion, nil];
    }
    
    // 最新版本
    NSArray *newVerArr;
    if ((range = [newVersion rangeOfString:@"."]).location != NSNotFound) {
        newVerArr = [newVersion componentsSeparatedByString:@"."];
    } else {
        newVerArr = [[NSArray alloc] initWithObjects:newVersion, nil];
    }
    
    NSInteger curCount = [curVerArr count];
    NSInteger newCount = [newVerArr count];
    
    for (NSInteger i = 0; i < newCount; i++) {
        NSString *s = [newVerArr objectAtIndex:i];
        
        if (i < curCount) {
            NSString *curStr = [curVerArr objectAtIndex:i];
            
            if ([s intValue] > [curStr intValue]) {
                return YES;
            } else if ([s intValue] < [curStr intValue]) {
                return NO;
            }
        } else {
            return YES;
        }
    }
    return NO;
}

/**
 *	@brief	从appstore上获取版本信息（版本号,下载地址）
 *
 *	@param 	appID 	应用id
 *
 *  @appInfo: @版本号,@"version", @下载地址, @"trackViewUrl"
 */
+ (void)versionOfAppStore:(NSString *)appID completionHander:(void (^)(NSURLResponse* response, NSDictionary* appInfo, NSError* connectionError)) handler
{
    NSString *urlString = [NSString stringWithFormat:@"http://itunes.apple.com/lookup"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"POST"];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *bodyStr = [NSString stringWithFormat:@"id=%@", appID];
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        handler(response, result, connectionError);
    }];
}

// 当前版本
+ (NSString *)versionOfLocal {
    NSDictionary *infoDict = [[NSBundle mainBundle]infoDictionary];
    NSString *curVersion = [infoDict objectForKey:@"CFBundleVersion"];
    return curVersion;
}

@end
