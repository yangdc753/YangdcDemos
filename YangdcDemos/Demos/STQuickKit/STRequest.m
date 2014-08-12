//
//  STRequest.m
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

#import "STRequest.h"

@implementation STRequest

+ (void)sendAsynchronousRequestWithUrlString:(NSString *)url
                                      params:(NSDictionary *)dict
                                      method:(STRequestMethod)method
                           completionHandler:(STRequestCompletion)completionHandler
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    if (dict) {
        NSMutableString *paramsStr = [NSMutableString stringWithCapacity:0];
        NSMutableArray *paramsArr = [NSMutableArray arrayWithCapacity:0];
        for (NSString *key in dict) {
            id value = dict[key];
            NSString *param = [NSString stringWithFormat:@"%@=%@", key, value];
            [paramsArr addObject:param];
        }
        [paramsStr appendString:[paramsArr componentsJoinedByString:@"&"]];
        
        if (method == STRequestMethodPost) {
            NSData *paramsData = [paramsStr dataUsingEncoding:NSUTF8StringEncoding];
            [request setHTTPBody:paramsData];
        }
        
        if (method == STRequestMethodGet) {
            if ([url rangeOfString:@"?"].location != NSNotFound) {
                url = [url stringByAppendingFormat:@"&%@", paramsStr];
            } else {
                url = [url stringByAppendingFormat:@"?%@", paramsStr];
            }
        }
    }
    
    url = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [request setURL:[NSURL URLWithString:url]];
    
    NSString *methodStr = [STRequest requestMethodName:method];
    [request setHTTPMethod:methodStr];

    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * __unused response, NSData *data, NSError *connectionError) {
        NSString *resultStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if (completionHandler) {
            completionHandler(resultStr, info, connectionError);
        }
    }];
}

+ (NSString *)requestMethodName:(STRequestMethod)method
{
    switch (method) {
        case STRequestMethodGet:
            return @"GET";
            break;
        case STRequestMethodPost:
            return @"POST";
        default:
            break;
    }
    return @"POST";
}

@end
