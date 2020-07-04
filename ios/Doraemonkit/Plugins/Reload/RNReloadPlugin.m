//
//  RNReloadPlugin.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/18.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RNReloadPlugin.h"

#import <React/RCTBridge+Private.h>
#import <DoraemonKit/DoraemonHomeWindow.h>
#import <UIKit/UIKit.h>

#import "RNDoraemonkit.h"

@implementation RNReloadPlugin

//- (void)pluginDidLoad{
//  NSLog(@"RNReloadPlugin didload");
//}

- (void)pluginDidLoad:(NSDictionary *)itemData {
    NSLog(@"RNReload plugindidload itemData= %@", itemData);
    [[RNDoraemonkit shareInstance] setDefaultBundleUrl:false];
    [[RCTBridge currentBridge] reload];
    [[DoraemonHomeWindow shareInstance] hide];
}

@end
