//
//  ImageNSOperationViewController.m
//  AppDemo
//
//  Created by ydc on 14-7-11.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "ImageNSOperationViewController.h"

@interface ImageNSOperationViewController ()

@end

@implementation ImageNSOperationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}
- (id)init
{
    return [self initWithNibName:@"ImageNSOperationViewController" bundle:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reload:(id __unused)sender {
    NSString *newUrl = [NSString stringWithFormat:@"http://static2.dmcdn.net/static/video/666/645/43546666:jpeg_preview_source.jpg?%d",(int)[NSDate timeIntervalSinceReferenceDate]];
    ImageDownloader *imageDownloader = [[ImageDownloader alloc]initWithURLString:newUrl];
    imageDownloader.delegate = self;
    [self.queue addOperation:imageDownloader];
}
- (void)imageDidFinished:(UIImage *)image para:(NSObject * __unused)obj{
    self.imageView.image = image;
}

@end
