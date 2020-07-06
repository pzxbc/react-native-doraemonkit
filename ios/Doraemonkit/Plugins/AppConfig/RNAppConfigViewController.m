//
//  RNAppConfigViewController.m
//  Doraemonkit
//
//  Created by G20-MAC on 2020/7/4.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import "RNAppConfigViewController.h"
#import <DoraemonKit/DoraemonKit.h>
#import <DoraemonKit/DoraemonCellInput.h>
#import <DoraemonKit/DoraemonDefine.h>
#import "DoraemonCacheManager+RNDevTool.h"
#import "RNDevToolConstants.h"

@interface RNAppConfigViewController ()<UITextInputDelegate>

@property (nonatomic, strong) DoraemonCellInput *inputView;

@end

@implementation RNAppConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"App配置";
    
    _inputView = [[DoraemonCellInput alloc] initWithFrame:CGRectMake(0, self.bigTitleView.doraemon_bottom, self.view.doraemon_width, kDoraemonSizeFrom750(104))];
    [_inputView renderUIWithTitle:@"服务器"];
    _inputView.textField.placeholder = @"点击输入地址[kd.163.com]";
    _inputView.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inputView.textField.keyboardType = UIKeyboardTypeURL;
    _inputView.textField.returnKeyType = UIReturnKeyDone;
    _inputView.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [_inputView needTopLine];
    [_inputView needDownLine];
    _inputView.textField.delegate = self;
    _inputView.textField.accessibilityIdentifier = RNDevServerHostKey;
    NSString *serverHost = [[DoraemonCacheManager sharedInstance] getInfoByKey:RNDevServerHostKey];
    if (serverHost) {
        _inputView.textField.text = serverHost;
    }
    [self.view addSubview:_inputView];
}

- (BOOL)needBigTitleView{
    return YES;
}

#pragma mark -- textinputDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@: %@ ", textField.accessibilityIdentifier, textField.text);
    // 判断textfield是否有设置标识
    if (!textField.accessibilityIdentifier) {
        return;
    }
    if ([textField.accessibilityIdentifier isEqualToString:@""]) {
        return;
    }
    if([textField.text isEqualToString:@""]) {
        [[DoraemonCacheManager sharedInstance] delKey:textField.accessibilityIdentifier];
        return;
    }
    [[DoraemonCacheManager sharedInstance] saveInfoByKey:textField.accessibilityIdentifier val:textField.text];
}

@end
