//
//  LumberjackFrameworkAPI.m
//  
//
//  Created by Zakk Hoyt on 8/28/15.
//
//

#import "LumberjackFrameworkAPI.h"
#import <PubNub/PubNub.h>

#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"

@interface LumberjackFrameworkAPI () <PNObjectEventListener>
@property (nonatomic) PubNub *client;
@end

@implementation LumberjackFrameworkAPI

- (instancetype)init
{
    self = [super init];
    if (self) {
        PNConfiguration *configuration = [PNConfiguration configurationWithPublishKey:@"demo"
                                                                         subscribeKey:@"demo"];
        self.client = [PubNub clientWithConfiguration:configuration];
        [self.client addListener:self];
        [self.client subscribeToChannels:@[@"my_channel"] withPresence:YES];
    }
    return self;
}


+(void)initialize{
    
}

+(void)logString:(NSString*)string{
    DDLogDebug(@"%@", string);
}


#pragma mark PubNub stuff

- (void)client:(PubNub *)client didReceiveMessage:(PNMessageResult *)message {
    
    // Handle new message stored in message.data.message
    if (message.data.actualChannel) {
        
        // Message has been received on channel group stored in
        // message.data.subscribedChannel
    }
    else {
        
        // Message has been received on channel stored in
        // message.data.subscribedChannel
    }
    NSLog(@"Received message: %@ on channel %@ at %@", message.data.message,
          message.data.subscribedChannel, message.data.timetoken);
}

- (void)client:(PubNub *)client didReceiveStatus:(PNSubscribeStatus *)status {
    
    if (status.category == PNUnexpectedDisconnectCategory) {
        // This event happens when radio / connectivity is lost
    }
    
    else if (status.category == PNConnectedCategory) {
        
        // Connect event. You can do stuff like publish, and know you'll get it.
        // Or just use the connected event to confirm you are subscribed for
        // UI / internal notifications, etc
        
        [self.client publish:@"Hello from the PubNub Objective-C SDK" toChannel:@"my_channel"
              withCompletion:^(PNPublishStatus *status) {
                  
                  // Check whether request successfully completed or not.
                  if (!status.isError) {
                      
                      // Message successfully published to specified channel.
                  }
                  // Request processing failed.
                  else {
                      
                      // Handle message publish error. Check 'category' property to find out possible issue
                      // because of which request did fail.
                      //
                      // Request can be resent using: [status retry];
                  }
              }];
    }
    else if (status.category == PNReconnectedCategory) {
        
        // Happens as part of our regular operation. This event happens when
        // radio / connectivity is lost, then regained.
    }
    else if (status.category == PNDecryptionErrorCategory) {
        
        // Handle messsage decryption error. Probably client configured to
        // encrypt messages and on live data feed it received plain text.
    }
    
}


@end
