//
//  DoraemonWeexLogger.m
//  Chameleon_Example
//
//  Created by yixiang on 2019/5/23.
//  Copyright © 2019年 Chameleon-Team. All rights reserved.
//

#import "DoraemonWeexLogger.h"
#import "DoraemonWeexLogModel.h"
#import "DoraemonWeexLogDataSource.h"

@implementation DoraemonWeexLogger

- (void)startLog{
    //[WXLog registerExternalLog:self];
    RCTAddLogFunction(^(RCTLogLevel level, RCTLogSource source, NSString *fileName, NSNumber *lineNumber, NSString *message) {
        [self log:level message:message];
    });
}

- (void)log:(RCTLogLevel)flag message:(NSString *)message{
    /*
    if ([message containsString:@"jsLog:"]) {
        NSRange range = [message rangeOfString:@"jsLog:"];
        NSInteger jslogStart = range.location+range.length;
        if (message.length > jslogStart) {
            DoraemonWeexLogModel *model = [[DoraemonWeexLogModel alloc] init];
            model.flag = flag;
            model.timeInterval = [[NSDate date] timeIntervalSince1970];
            model.expand = YES;
            NSString *jsLog = [message substringFromIndex:(range.location+range.length)];
            model.content = jsLog;
            [[DoraemonWeexLogDataSource shareInstance] addLog:model];
        }
    }
     */
    DoraemonWeexLogModel *model = [[DoraemonWeexLogModel alloc] init];
    model.flag = flag;
    model.timeInterval = [[NSDate date] timeIntervalSince1970];
    model.expand = YES;
    //NSString *jsLog = [message substringFromIndex:(range.location+range.length)];
    model.content = message;
    [[DoraemonWeexLogDataSource shareInstance] addLog:model];
}

@end
