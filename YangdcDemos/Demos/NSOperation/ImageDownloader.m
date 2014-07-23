//
//  ImageDownloader.m
//  NSOperationTest
//
//  Created by ydc on 11-10-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageDownloader.h"


@implementation ImageDownloader



- (id)initWithURLString:(NSString *)url 
{
    
    self = [self init];
    if (self) {
        assert(url != nil);
        _request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        _data = [NSMutableData data];
    }
    return self;
}

- (void)start {
    
    if (![self isCancelled]) {
        
        [NSThread sleepForTimeInterval:3];
        // 以异步方式处理事件，并设置代理
        
        _connection=[NSURLConnection connectionWithRequest:_request delegate:self];
        
        while(_connection != nil) {
            
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];   
            
        }
        
    }
    
}

#pragma mark NSURLConnection delegate Method

// 接收到数据（增量）时

- (void)connection:(NSURLConnection*)connection
    didReceiveData:(NSData*)data
{
    [_data appendData:data];
    if (self.delegate != nil){
        UIImage *img = [[UIImage alloc] initWithData:self.data] ;
        [_delegate imageDidFinished:img para:self.delPara];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection {
    if (self.delegate != nil)
    {
        UIImage *img = [[UIImage alloc] initWithData:self.data] ;
        [_delegate imageDidFinished:img para:self.delPara];
    }
    _connection=nil;
}

-(void)connection: (NSURLConnection *) connection didFailWithError: (NSError *) error
{
    _connection=nil;
}
- (void)cancelOnRequestThread
{
    [[self cancelledLock] lock];
    if ([self isCancelled]) {
		[[self cancelledLock] unlock];
		return;
	}
    [self willChangeValueForKey:@"isCancelled"];
    _cancelled = YES;
    [self didChangeValueForKey:@"isCancelled"];
    
    [[self cancelledLock] unlock];
}
- (BOOL)isCancelled
{
    BOOL result;
    
	[[self cancelledLock] lock];
    result = _cancelled;
    [[self cancelledLock] unlock];
    
    return result;
}
-(BOOL)isConcurrent
{
    return YES;
}
- (BOOL)isExecuting
{
    return _connection == nil; 
}
- (BOOL)isFinished
{
    return _connection == nil;  
}

@end
