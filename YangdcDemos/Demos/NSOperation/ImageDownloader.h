//
//  ImageDownloader.h
//  NSOperationTest
//
//  Created by ydc on 11-10-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol imageDownloaderDelegate;

@interface ImageDownloader : NSOperation 
{
    NSURLRequest* _request;
    
    NSURLConnection* _connection;
    
    NSMutableData* _data;
    
    BOOL _isFinished;
    
    BOOL _cancelled;
}

- (id)initWithURLString:(NSString *)url;

@property(readonly) NSData *data;
@property(nonatomic, assign) id<imageDownloaderDelegate> delegate;
@property(nonatomic, strong) NSObject *delPara;
@property(nonatomic, strong) NSRecursiveLock *cancelledLock;


@end

@protocol imageDownloaderDelegate

@optional

//图片下载完成的委托
- (void)imageDidFinished:(UIImage *)image para:(NSObject *)obj;

@end
