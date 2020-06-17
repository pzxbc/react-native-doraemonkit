# 使用CocoaPods管理[Legacy]

`DoraemonKit`库支持`CocoaPods`进行管理，另外由于`DoraemonKit`需要添加的第三方库比较多，因此这里也学习使用下`CocoaPods`进行依赖库管理，后续也方便升级`DoraemonKit`。

关于`CocoaPods`的安装与配置参考[官方文档](https://guides.cocoapods.org/using/getting-started.html)

## `react-native-doraemonkit`使用`CocoaPods`管理

进入`react-native-doraemonkit/ios`目录，运行`pod init`命令，会在当前目录生成一个`Podfile`文件。编辑`Podfile`文件，添加下面内容

```
# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

target 'Doraemonkit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Doraemonkit
  pod 'DoraemonKit/Core', '~> 3.0.2', :configurations => ['Debug'] #Required

end
```

安装依赖库

```sh
pod install
```

