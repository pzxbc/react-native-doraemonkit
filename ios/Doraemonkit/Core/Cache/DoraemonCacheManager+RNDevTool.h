//
//  DoraemonCacheManager+DoraemonCacheManager_RN.h
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/19.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DoraemonKit/DoraemonKit.h>
#import <DoraemonKit/DoraemonCacheManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoraemonCacheManager (RNDevTool)

@property (nonatomic, strong) NSUserDefaults *defaults;

// Todo: 这个名字有混淆性 好像是保存服务端的server 后面改一下 改成clientserverinfo
- (void)saveServerInfo:(NSDictionary*)serverInfo;
- (NSDictionary*)serverInfo;

-(void)saveInfoByKey:(NSString*)key val:(NSString*)val;
-(NSString*)getInfoByKey:(NSString*)key;

-(void)delKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
