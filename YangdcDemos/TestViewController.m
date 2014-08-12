//
//  TestViewController.m
//  YangdcDemos
//
//  Created by ydc on 14-7-29.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
@property (strong, nonatomic) IBOutlet UITextView *testview;

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
- (IBAction)test:(id)sender {
//    NSLog([self.web stringByEvaluatingJavaScriptFromString:@"window.location.href"]);
//    QLPreviewController *qlprview = [[QLPreviewController alloc]init];
//    qlprview.delegate = self;
//    qlprview.dataSource = self;
    [self addObserver:self forKeyPath:@"self.historyDetailController.retainCount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
  
    
}
- (UIImage *)getImage:(UIView*)view{
    if(UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(view.frame.size);
    }
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
