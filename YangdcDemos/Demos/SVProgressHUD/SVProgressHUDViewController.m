//
//  SVProgressHUDViewController.m
//  AppDemo
//
//  Created by ydc on 14-7-11.
//  Copyright (c) 2014年 ydc. All rights reserved.
//

#import "SVProgressHUDViewController.h"

@interface SVProgressHUDViewController ()

@end

@implementation SVProgressHUDViewController

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
    return [self initWithNibName:@"SVProgressHUDViewController" bundle:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)test:(id)sender {
    [SVProgressHUD showProgress:0.1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // time-consuming task
        dispatch_async(dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
