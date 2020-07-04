#import <React/RCTBridgeModule.h>

@interface RNDoraemonkit : NSObject <RCTBridgeModule>

@property bool defaultBundleUrl;

+ (nonnull RNDoraemonkit *)shareInstance;

+ (NSURL *)bundleURL;

@end
