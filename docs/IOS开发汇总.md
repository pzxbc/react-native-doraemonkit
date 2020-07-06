# IOS开发汇总

[UITextField控件使用](https://www.jianshu.com/p/4d38889500df)

[IOS键盘样式说明](https://www.jianshu.com/p/5d2a2c7aaf78)

## IOS UIView控件设置标识

```objective-c
view.accessibilityIdentifier = @"tag1";
```

每个UIView的`AccessibilityIdentifier`属性都是唯一的，默认是`nil`

比如有许多UITextField组件，但只有一个`TextFieldDelegate`对象处理事件时，可以通过`AccessibilityIdentitfier`属性来区分是哪个控件产生的事件

```objective-c
    // 判断是否为nil以及是否为空字符
    if (!textField.accessibilityIdentifier) {
        return;
    }
    if ([textField.accessibilityIdentifier isEqualToString:@""]) {
        return;
    }

```

