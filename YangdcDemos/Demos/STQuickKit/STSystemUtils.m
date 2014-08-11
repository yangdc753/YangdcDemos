//
//  STSystemUtils.m
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

#import "STSystemUtils.h"
#import <MessageUI/MessageUI.h>
#import "Reachability.h"

@implementation STSystemUtils

/**
 *	@brief	拨打电话
 *
 *	@param 	phoneNo 	电话号码
 */
+ (void)call:(NSString *)phoneNo
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNo]];
    UIWebView*phoneCallWebView =[[UIWebView alloc] init];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}

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
                                   delegate:(UIViewController<MFMessageComposeViewControllerDelegate> *)delegate

{
    MFMessageComposeViewController *megVC = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText]) {
        
        megVC.body = bodyOfMessage;
        if (recipients != nil) {
            megVC.recipients = recipients;
        }
        
        megVC.messageComposeDelegate = delegate;
        [delegate presentViewController:megVC animated:YES completion:^{ }];
    }
    return megVC;
}

/**
 *	@brief	是否联网
 *
 *	@return	是否联网状态
 */
+ (BOOL)isNetConnect
{
    return [[Reachability reachabilityForInternetConnection] isReachable];
}

/**
 *	@brief	是否通过WiFi联网
 *
 *	@return	是否通过WiFi联网状态
 */
+ (BOOL)isNetViaWiFi
{
    if ([self isNetConnect]) {
        return [[Reachability reachabilityForInternetConnection] isReachableViaWiFi];
    }
    return NO;
}

/**
 *	@brief	是否通过3G联网
 *
 *	@return	是否通过3G联网状态
 */
+ (BOOL)isNetViaWWAN

{
    if ([self isNetConnect]) {
        return [[Reachability reachabilityForInternetConnection] isReachableViaWWAN];
    }
    return NO;
}

/**
 *	@brief	获取设备唯一码
 *
 *	@return	唯一码
 */
+ (NSString *)getIOSGuid

{
//    NSString* openUDID = [OpenUDID value];
    NSString *openUDID = @"";
    return openUDID;
}

@end
