# DoraemonKit生成

`DoraemonKit`提供的是`CocoaPods`的方式集成，但是RN0.59对于库的管理方式没有使用`CocoaPods`。因此需要将`DoraemonKit`编译生成动态库`Framework`，然后集成进`react-native-doraemonkit`模块中。

`Framework`的生成使用了`CocoaPods/Rome`插件，具体使用可以查看github上的说明。

新建一个`Podfile`

```
platform :ios, '8.0'

plugin 'cocoapods-rome', {
  dsym: false,
  configuration: 'Release'
}

target 'DoraemonKitFramework' do
  pod 'DoraemonKit/Core', '~> 3.0.2'
end
```

然后运行`pod install`命令，在生成`Rome`目录下即可找到对应的`Framework`文件。

## 参考

1. [Using CocoaPods to just build frameworks for use elsewhere](https://blog.kulman.sk/using-pods-to-just-build-frameworks/)
2. [CocoaPods/Rome](https://github.com/CocoaPods/Rome)