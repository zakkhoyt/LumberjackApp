//
//  ViewController.m
//  LumberjackApp
//
//  Created by Zakk Hoyt on 8/28/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ViewController.h"
#import "DDLog.h"

@import LumberjackFramework;

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appButtonTouchUpInside:(id)sender {
//    [LumberjackFrameworkAPI logString:@"test"];

    DDLogDebug(@"Logging with lumberjack from app");
//    DDLogError(@"This is an error.");
//    DDLogWarn(@"This is a warning.");
//    DDLogInfo(@"This is just a message.");
//    DDLogVerbose(@"This is a verbose message.");
}


- (IBAction)frameworkButtonTouchUpInside:(id)sender {
    [LumberjackFrameworkAPI logString:@"test"];
}

@end
