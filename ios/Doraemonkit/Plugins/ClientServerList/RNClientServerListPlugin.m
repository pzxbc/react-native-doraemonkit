//
//  ServerListPlugin.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/18.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RNClientServerListPlugin.h"
#import "RNClientServerListViewController.h"
#import <DoraemonKit/DoraemonHomeWindow.h>

@implementation RNClientServerListPlugin

- (void)pluginDidLoad{
    RNClientServerListViewController *vc = [[RNClientServerListViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
