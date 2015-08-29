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
@property (nonatomic, strong) LumberjackFrameworkAPI *lumberjackAPI;
@end

@implementation ViewController

- (IBAction)appButtonTouchUpInside:(id)sender {
    DDLogDebug(@"Logging with lumberjack from app");
}


- (IBAction)frameworkButtonTouchUpInside:(id)sender {
    
    [LumberjackFrameworkAPI logString:@"Logging with lumberjack from framework"];
    
    if(_lumberjackAPI == nil) {
        _lumberjackAPI = [[LumberjackFrameworkAPI alloc]init];
    }
    
    
}

@end
