//
//  STAppUpdate.h
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

#import <Foundation/Foundation.h>

/**
 *	@brief	应用更新
 */
@interface STAppUpdate : NSObject


+ (BOOL)hasNewVersion:(NSString *)newVersion;
+ (NSString *)versionOfLocal;

/**
 *	@brief	从appstore上获取版本信息（版本号,下载地址）
 *
 *	@param 	appID 	应用id
 *
 *  @appInfo: @版本号,@"version", @下载地址, @"trackViewUrl"
 */
+ (void)versionOfAppStore:(NSString *)softID completionHander:(void (^)(NSURLResponse* response, NSDictionary* appInfo, NSError* connectionError)) handler;


@end
