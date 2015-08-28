//
//  LumberjackFrameworkAPI.m
//  
//
//  Created by Zakk Hoyt on 8/28/15.
//
//

#import "LumberjackFrameworkAPI.h"

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"

//@import CocoaLumberjack;
//#import "CocoaLumberjack.h"
//#import "DDLogMacros.h"



#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@implementation LumberjackFrameworkAPI

+(void)initialize{
    // Configure CocoaLumberjack
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

}
+(void)logString:(NSString*)string{
    DDLogDebug(@"Logging with lumberjack from framework");
}
@end
