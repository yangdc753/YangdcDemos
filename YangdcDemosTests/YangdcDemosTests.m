//
//  YangdcDemosTests.m
//  YangdcDemosTests
//
//  Created by ydc on 14-7-23.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Tool.h"
@interface YangdcDemosTests : XCTestCase

@end

@implementation YangdcDemosTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)test1{
    [Tool getFilenamelistfromDirPath:@"/Users/ydc/Library/Application Support/iPhone Simulator/7.1-64/Applications/7232BB38-135C-4C16-B0BA-4ED9CB609964/Library/Caches/558bf1819356f1e7ccdb0be3ab0535fd/contents/thumbnail"];
    
}

@end
