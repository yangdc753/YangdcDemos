//
//  STQuickKit.h
//  STQuickKit
//
//  Created by yls on 13-11-13.
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

#ifndef STQuickKit_STQuickKit_h
#define STQuickKit_STQuickKit_h


#ifndef __IPHONE_5_0
#error "STQuickKit uses features only available in iOS SDK 5.0 and later."
#endif

// ==================================================================
//                            框架指南
// ==================================================================

// 1. 依赖文件：CFNetwork, MessageUI, Reachability, sqlite3.0.dylib
// 2. 框架支持iOS 5.0 以上


// ==================================================================
//                            头文件
// ==================================================================

#import "STAppUpdate.h"
#import "STSystemUtils.h"
#import "STRequest.h"
#import "STBaseViewController.h"
#import "STDbObject.h"

// ==================================================================
//                            系统相关宏定义
// ==================================================================
/// 判断是否是iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/// 屏幕高度、宽度
#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

/// 当前系统版本大于等于某版本
#define iOS_SYSTEM_VERSION_EQUAL_OR_ABOVE(v) (([[[UIDevice currentDevice] systemVersion] floatValue] >= (v))? (YES):(NO))
/// 当前系统版本小于等于某版本
#define iOS_SYSTEM_VERSION_EQUAL_OR_BELOW(v) (([[[UIDevice currentDevice] systemVersion] floatValue] <= (v))? (YES):(NO))
/// 当前系统版本
#define iOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define iOS7 (IOS_SYSTEM_VERSION >= 7.0)

/// 当前应用版本号
#define AppVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]

/// Documents路径
#define DocumentsPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

/** ======================= 调试相关宏定义 ========================== */
/// 添加调试控制台输出
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d]\n😄 " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define ELog(fmt, ...) NSLog((@"%s [Line %d]\n😥 " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#define ELog(...)
#define NSLog(...)
#endif

/// 是否输出dealloc log
//#define Dealloc

#ifdef Dealloc
#define DeallocLog(fmt, ...) NSLog((@"%s [Line %d]" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DeallocLog(...)
#endif

/** ======================= 其他宏定义 ========================== */

#define obj2str(obj) [NSString stringWithFormat:@"%@", obj]


#endif
