//
//  Model.h
//  YangdcDemos
//
//  Created by ydc on 14-8-21.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDbObject.h"
@interface Model : STDbObject
@property (nonatomic, retain) NSString * nsstring;
@property (nonatomic, retain) NSNumber * nsnumber;
//@property (nonatomic, retain) NSDecimalNumber * nsdecimalnumber;
//@property (nonatomic, retain) NSArray * nsarray;
//@property (nonatomic, retain) NSDictionary * nsdictionary;
//@property (nonatomic, retain) NSNull * nsnull;
//@property (nonatomic, retain) NSMutableString * nsmutablestring;
//@property (nonatomic, retain) NSMutableArray * nsmutablearray;
//@property (nonatomic, retain) NSMutableDictionary * nsmutabledictionary;
//@property (nonatomic, assign) int  i;
@property (nonatomic, assign) float  f;
//@property (nonatomic, assign) double  d;
@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) NSDate * date;
@end
