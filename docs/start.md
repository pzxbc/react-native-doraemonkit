# Start

## 创建NativeModules项目结构

先安装创建`NativeModules`的工具

```sh
yarn global add create-native-module@0.12.0
```

> `create-native-module@0.12.0`是最后一个支持RN0.59版本的

创建`NativeModules`项目结构

```sh
create-react-native-module --package-identifier com.pzxbc --github-account pzxbc --author-name pzxbc --author-email pzxbc@qq.com doraemonkit
```

## 创建Example

安装ReactNative项目创建工具

```sh
yarn global add react-native-cli
```

创建Example

```sh
cd react-native-doraemonkit
mkdir examples
react-native init DoraemonkitDemo --version 0.59.10
```

运行demo项目

```sh
cd DoraemonkitDemo
react-native run-ios
```

## 链接react-native-doraemonkit

`DoraemonkitDemo`项目接入`react-native-doraemonkit`

```sh
cd DoraemonkitDemo
yarn add file:../../
react-native linke react-native-doraemonkit
```

解决递归包含导致的`Haste module naming collision`的问题，修改`metro.config.js`文件，添加下面的黑名单

```js
/**
 * Metro configuration for React Native
 * https://github.com/facebook/react-native
 *
 * @format
 */

const blacklist = require("metro-config/src/defaults/blacklist");

module.exports = {
  resolver: {
    blacklistRE: blacklist([/node_modules\/.*\/node_modules\/react-native\/.*/])
  },
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: false
      }
    })
  }
}; 
```

## 测试react-native-doraemonkit

`app.js`中添加下面调用

```tsx
<Button
  onPress={() => {
    // alert('You tapped the button')
    Doraemonkit.sampleMethod('test', 123, (val) => {
       alert(val)
    })
  }}
  title="Press me"
/>
```