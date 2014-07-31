//
//  TestViewController.m
//  YangdcDemos
//
//  Created by ydc on 14-7-29.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.web loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"wwww.baidu.com"]]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.web loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)test:(id)sender {
    NSLog([self.web stringByEvaluatingJavaScriptFromString:@"window.location.href"]);
}

@end
