//
//  RNAppConfigPlugin.m
//  Doraemonkit
//
//  Created by G20-MAC on 2020/7/4.
//  Copyright © 2020 Facebook. All rights reserved.
//

//
//  RNReloadPlugin.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/18.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RNAppConfigPlugin.h"

#import <React/RCTBridge+Private.h>
#import <DoraemonKit/DoraemonHomeWindow.h>
#import <UIKit/UIKit.h>
#import "RNAppConfigViewController.h"

@implementation RNAppConfigPlugin

- (void)pluginDidLoad{
    RNAppConfigViewController *vc = [[RNAppConfigViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end

