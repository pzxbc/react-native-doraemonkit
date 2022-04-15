//
//  ServerListPlugin.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/18.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "TX3ServerListPlugin.h"
#import "TX3ServerListViewController.h"
#import <DoraemonKit/DoraemonHomeWindow.h>

@implementation TX3ServerListPlugin

- (void)pluginDidLoad{
    TX3ServerListViewController *vc = [[TX3ServerListViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
