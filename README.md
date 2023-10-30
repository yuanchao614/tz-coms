<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


## Features

TODO: 项目中常用组件封装

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

* pubspec.yaml
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^1.0.0
  tz_coms:
    path: '../'
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.

## Doc

* TzAvator组件
![TzAvator](/images/Screenshot_20231030_171844_com.example.example.jpg)

```dart
            TzAvator(
              url:
                  'http://hospital-test-1308953979.cos.ap-chengdu.myqcloud.com/img/111/23092516502193794220201065.png',
            ),
```

* TzModalBottomSheet 组件
![TzModalBottomSheet](/images/Screenshot_20231030_171854_com.example.example.jpg)

```dart
            TextButton(
                onPressed: () {
                  TzModalBottomSheet.showTzModalBottomSheet(context,
                      showTopBtn: true,
                      enableDrag: true,
                      sheetListWidget: [Text('测试')]);
                },
                child: Text('点击弹出sheetbuttom')),
```

* TzStepNumber 组件
![TzStepNumber](/images/Screenshot_20231030_171844_com.example.example.jpg)

```dart
            TzStepNumber(
              enabled: false,
              addValueChanged: (value) {},
              removeValueChanged: (value) {},
              updateValueChanged: (value) {},
            ),
```

* TzHorizontalBar 组件
![TzHorizontalBar](/images/Screenshot_20231030_171844_com.example.example.jpg)

```dart
 TzHorizontalBar(
                  dataList: const [
                    {'label': '全部', 'value': 0},
                    {'label': '待支付', 'value': 1},
                    {'label': '已支付', 'value': 2},
                    {'label': '待退货', 'value': 3},
                    {'label': '待退款', 'value': 4},
                    {'label': '待结算', 'value': 5},
                    {'label': '待评价', 'value': 6},
                    {'label': '待回访', 'value': 7},
                  ],
                  activeIndex: activeIndex,
                  isRound: true,
                  handleTapChanged: (index) {
                    print(index);
                    _activeIndexChange(index);
                  }),
```

* TzDialog 组件
![TzDialog](/images/Screenshot_20231030_171912_com.example.example.jpg)

```dart
            TextButton(
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => TzDialog(
                        child: Text('确定要删除吗？'),
                        handleConfirm: () {
                          Navigator.pop(context);
                        },
                      )),
              child: const Text('Show Dialog'),
            ),
```
