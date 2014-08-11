//
//  STSystemUtils.h
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
#import <UIKit/UIKit.h>
#import <CFNetwork/CFNetwork.h>

@class MFMessageComposeViewController;
@protocol MFMessageComposeViewControllerDelegate;

/**
 *	@brief	系统常用方法
 */
@interface STSystemUtils : NSObject


/**
 *	@brief	拨打电话
 *
 *	@param 	phoneNo 	电话号码
 */
+ (void)call:(NSString *)phoneNo;


/**
 *	@brief	发送短信
 *
 *	@param 	bodyOfMessage 	短信内容
 *	@param 	recipients      收信人
 *	@param 	delegate        代理
 *
 *	@return             发送短信视图
 */
+ (MFMessageComposeViewController *)sendSMS:(NSString *)bodyOfMessage
                              recipientList:(NSArray *)recipients
                                   delegate:(UIViewController<MFMessageComposeViewControllerDelegate> *)delegate;

/**
 *	@brief	是否联网
 *
 *	@return	是否联网状态
 */
+ (BOOL)isNetConnect;

/**
 *	@brief	是否通过WiFi联网
 *
 *	@return	是否通过WiFi联网状态
 */
+ (BOOL)isNetViaWiFi;

/**
 *	@brief	是否通过3G联网
 *
 *	@return	是否通过3G联网状态
 */
+ (BOOL)isNetViaWWAN;

/**
 *	@brief	获取设备唯一码
 *
 *	@return	唯一码
 */
+ (NSString *)getIOSGuid;

@end
