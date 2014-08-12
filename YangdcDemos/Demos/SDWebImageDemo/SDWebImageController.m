//
//  SDWebImageController.m
//  AppDemo
//
//  Created by ydc on 14-7-9.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "SDWebImageController.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+LK.h"
#import "objc/runtime.h"

@interface SDWebImageController ()
- (void)configureView;
@end

@implementation SDWebImageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (id)init
{
    return [self initWithNibName:@"SDWebImageController_iphone" bundle:nil];
}
- (void)setImageURL:(NSURL *)imageURL
{
    if (_imageURL != imageURL)
    {
        _imageURL = imageURL;
//        [self configureView];
    }
}
- (IBAction)rload:(id __unused)sender {
    self.imageURL = [NSURL URLWithString:@"http://static2.dmcdn.net/static/video/666/645/43546666:jpeg_preview_source.jpg?20120412153140"];
    NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
    NSRange range = NSMakeRange(0, imageData.length-1000);
    imageData = [imageData subdataWithRange:range];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
}

- (void)configureView
{
    if (self.imageURL)
    {
        //__weak specifies a reference that does not keep the referenced object alive. A weak reference is set to nil when there are no strong references to the object.
        // __weak 修饰符的变量所引用的对象被废弃，则将nil 赋值给该变量
        __weak UIImageView *weakImageView = self.imageView;
        weakImageView.imageURL = self.imageURL;
    }
}

- (void)test{
    
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
