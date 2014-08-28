//
//  AppDelegate.m
//  YangdcDemos
//
//  Created by ydc on 14-7-23.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import <objc/runtime.h>
#import "Reachability.h"
#import "STDb.h"
#import "OpenUDID.h"
#import "Model.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication * __unused)application didFinishLaunchingWithOptions:(NSDictionary * __unused)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //处理崩溃情况
    NSSetUncaughtExceptionHandler (&CrashHandlerExceptionHandler);
//    [self redirectNSlogToDocumentFolder];
//    [self test];
    // Override point for customization after application launch.
    Model *m = [[Model alloc]init];
    m.date = [NSDate date];
    m.nsstring = @"1111";
    m.f = 10.0f;
    m.data = [NSData data];
    m.nsnumber = @(213123);
//    [m insertToDb];
    [m updateToDbsWhere:@"f = 1"];
//    [STDb createDbTable:[Model class]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)test{
    //知道怎么用私有api，要怎么获得
    //要导入#import <objc/runtime.h>
    NSString *className = NSStringFromClass([UIView class]);
    //这里是uiview，可以改成自己想要的
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount;
    
    Method *m = class_copyMethodList(theClass,&outCount);
    
    NSLog(@"q%d",outCount);
    for (unsigned int i = 0; i<outCount; i++) {
        SEL a = method_getName(*(m+i));
        NSString *sn = NSStringFromSelector(a);
        NSLog(@"q%@",sn);
    }
}
//处理崩溃情况
void CrashHandlerExceptionHandler(NSException *exception) {
    NSLog(@"name: %@ \
          reason: %@ \
          userInfo: %@"
          ,[exception name],[exception reason],[exception userInfo]);
    for (NSString *callStackSymbol in [exception callStackSymbols]) {
        NSLog(@"%@",callStackSymbol);
    }
}

- (void)applicationWillResignActive:(UIApplication * __unused)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication * __unused)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication * __unused)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication * __unused)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication * __unused)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//把NSLog日志写入文件
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
- (void)redirectNSlogToDocumentFolder
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"dr.log"];
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}

@end
