//
//  DoraemonWeexLogPlugin.m
//  Chameleon_Example
//
//  Created by yixiang on 2019/5/23.
//  Copyright © 2019年 Chameleon-Team. All rights reserved.
//

#import "DoraemonWeexLogPlugin.h"
#import <DoraemonKit/DoraemonHomeWindow.h>
#import "DoraemonWeexLogViewController.h"

@implementation DoraemonWeexLogPlugin

- (void)pluginDidLoad{
    DoraemonWeexLogViewController *vc = [[DoraemonWeexLogViewController alloc] init];
    [DoraemonHomeWindow openPlugin:vc];
}

@end
