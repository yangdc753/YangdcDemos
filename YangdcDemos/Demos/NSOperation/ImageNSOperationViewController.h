//
//  ImageNSOperationViewController.h
//  AppDemo
//
//  Created by ydc on 14-7-11.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownloader.h"

@interface ImageNSOperationViewController : UIViewController<imageDownloaderDelegate>
@property (strong, nonatomic)NSOperationQueue *queue;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (void)imageDidFinished:(UIImage *)image para:(NSObject *)obj;
@end
