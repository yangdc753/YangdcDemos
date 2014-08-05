//
//  Localization.h
//  YangdcDemos
//
//  Created by ydc on 14-8-4.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Localization : NSManagedObject

@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * localizationString;
@property (nonatomic, retain) NSString * title;

@end
