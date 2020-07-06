#import "RNDoraemonkit.h"
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import "DoraemonCacheManager+RNDevTool.h"
#import "RNDevToolConstants.h"
#import "DoraemonWeexLogDataSource.h"

#ifdef DEBUG
//#import <DOraemonKit/DoraemonManager.h>
#endif

@implementation RNDoraemonkit

+ (nonnull RNDoraemonkit *)shareInstance{
    static dispatch_once_t onceToken;
    static RNDoraemonkit *instance;
    dispatch_once(&onceToken, ^{
        instance = [[RNDoraemonkit alloc] init];
    });
    return instance;
}

- (instancetype)init
{
  if (self = [super init]) {
    self.defaultBundleUrl = true;
      [DoraemonWeexLogDataSource shareInstance];
  }
  return self;
}

+ (NSURL *)bundleURL
{
    if ([RNDoraemonkit shareInstance].defaultBundleUrl)
    {
      //return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
      return [[RCTBundleURLProvider sharedSettings] jsBundleURLForFallbackResource:nil fallbackExtension:nil];
    }
    else
    {
      // 恢复默认的
      [[RNDoraemonkit shareInstance] setDefaultBundleUrl:true];
      NSDictionary *serverInfo = [[DoraemonCacheManager sharedInstance] serverInfo];
      if (serverInfo != nil && serverInfo[@"ip"] && ![serverInfo[@"ip"] isEqualToString:@"127.0.0.1"])
      {
        return [RCTBundleURLProvider jsBundleURLForBundleRoot:@"index"
                                          packagerHost:serverInfo[@"ip"]
                                                          enableDev:true
                                                enableMinification:false];
      }
      else {
        return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
      }
    }
}

-(NSDictionary*)constantsToExport
{
    return @{
        @"ServerHostConfig": RNDevServerHostKey,
    };
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;  // only do this if your module initialization relies on calling UIKit!
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

RCT_EXPORT_METHOD(getConfigByKey:(NSString*)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    resolve([[DoraemonCacheManager sharedInstance] getInfoByKey:key]);
}

@end
