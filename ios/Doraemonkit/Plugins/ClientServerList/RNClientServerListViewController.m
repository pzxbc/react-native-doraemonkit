//
//  TX3ServerListViewController.m
//  DoraemonkitDemo
//
//  Created by G20-MAC on 2020/6/18.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RNClientServerListViewController.h"
#import <DoraemonKit/DoraemonCacheManager.h>
#import <DoraemonKit/DoraemonMemoryOscillogramWindow.h>
#import <DoraemonKit/DoraemonMemoryOscillogramViewController.h>
#import <DoraemonKit/DoraemonCellSwitch.h>
#import <DoraemonKit/DoraemonDefine.h>
#import "DoraemonCacheManager+RNDevTool.h"

@interface RNClientServerListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property NSIndexPath       *selIndex;      //单选选中的行
@property NSArray* serverList;

@end

@implementation RNClientServerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = DoraemonLocalizedString(@"客户端代码服务器");
  
  _selIndex = nil;
  _serverList = [self getServerInfo];
  int initIdx = [self getInitSelIndex];
  if (initIdx >= 0) {
    NSUInteger indexArr[] = {0, initIdx};
    _selIndex = [[NSIndexPath alloc] initWithIndexes:indexArr length:2];
  }
  /*
    _switchView = [[DoraemonCellSwitch alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(104))];
    
    [_switchView renderUIWithTitle:DoraemonLocalizedString(@"内存检测开关") switchOn:[[DoraemonCacheManager sharedInstance] memorySwitch]];
    [_switchView needTopLine];
    [_switchView needDownLine];
    _switchView.delegate = self;
    [self.view addSubview:_switchView];
   */
  _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750_Landscape(400))];
  //_tableView.translatesAutoresizingMaskIntoConstraints = true;
  [_tableView setDataSource:self];
  [_tableView setDelegate:self];
  [self.view addSubview:_tableView];
    //[[DoraemonMemoryOscillogramWindow shareInstance] addDelegate:self];
}

- (BOOL)needBigTitleView{
    return YES;
}

- (NSArray*) getServerInfo {
  NSURL *url = [NSURL URLWithString:@"http://listsvr.x.netease.com:6677/patch_list/g20/innerclientcode"];
  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
  NSError *error = nil;
  NSURLResponse *res = nil;
  NSData *json = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&error];
  NSInteger statusCode = ((NSHTTPURLResponse *)res).statusCode;
  NSArray* data = nil;
  if (json && statusCode == 200) {
    data = [NSJSONSerialization JSONObjectWithData:json options:kNilOptions error:nil];
  }
  return data;
}

- (int) getInitSelIndex {
  NSDictionary *serverInfo = [[DoraemonCacheManager sharedInstance] serverInfo];
  if (serverInfo == nil) {
    return -1;
  }
  int i;
  for (i = 0; i < [_serverList count]; i++)
  {
    NSDictionary *item = [_serverList objectAtIndex:i];
    if ([item[@"name"] isEqualToString:serverInfo[@"name"]] && [item[@"ip"] isEqualToString:serverInfo[@"ip"]])
    {
      return i;
    }
  }
  return -1;
}

#pragma mark -- TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (_serverList == nil)
  {
    return 0;
  }
  return _serverList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
  cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@",[((NSDictionary*)_serverList[indexPath.row]) objectForKey:@"name"],[((NSDictionary*)_serverList[indexPath.row]) objectForKey:@"ip"]];
    
    if (_selIndex == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark -- TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (_selIndex != nil)
  {
    // 之前有选中
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:_selIndex];
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  _selIndex = indexPath;
  [[DoraemonCacheManager sharedInstance] saveServerInfo:(NSDictionary*)_serverList[_selIndex.row]];
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end

