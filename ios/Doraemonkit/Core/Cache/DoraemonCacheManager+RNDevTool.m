//
//  DoraemonCacheManager+DoraemonCacheManager_RN.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/19.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "DoraemonCacheManager+RNDevTool.h"

static NSString *const ServerInfoKey = @"RNDevTool_serverInfo";

@implementation DoraemonCacheManager (RNDevTool)

- (void)saveServerInfo:(NSDictionary*)serverInfo
{
  [self.defaults setObject:serverInfo forKey:ServerInfoKey];
  [self.defaults synchronize];
}

- (NSDictionary*)serverInfo
{
  NSDictionary *serverInfo = [self.defaults dictionaryForKey:ServerInfoKey];
  return serverInfo;
}

-(void)saveInfoByKey:(NSString*)key val:(NSString*)val
{
    [self.defaults setObject:val forKey:key];
    [self.defaults synchronize];
}

-(NSString*)getInfoByKey:(NSString*)key
{
    NSString *val = [self.defaults stringForKey:key];
    return val;
}

@end
