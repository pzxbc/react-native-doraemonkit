//
//  DoraemonWeexLogger.h
//  Chameleon_Example
//
//  Created by yixiang on 2019/5/23.
//  Copyright © 2019年 Chameleon-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTLog.h>


@interface DoraemonWeexLogger : NSObject

- (void)startLog;
- (void)log:(RCTLogLevel)flag message:(NSString *)message;

@end

