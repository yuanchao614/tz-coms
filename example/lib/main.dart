import 'package:flutter/material.dart';
import 'package:tz_coms/tz_coms.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int activeIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _activeIndexChange(int i) {
    setState(() {
      activeIndex = i;
    });
  }

  Widget subTitle(String subTitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            child: Text(subTitle),
            padding: EdgeInsets.only(bottom: 12),
          ),
          Divider(
            height: 2.0,
            // indent: 60.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            subTitle('TzAvator-自定义头像组件'),
            TzAvator(
              url:
                  'http://hospital-test-1308953979.cos.ap-chengdu.myqcloud.com/img/111/23092516502193794220201065.png',
            ),
            subTitle('TzModalBottomSheet-自定义底部模态框组件'),
            TextButton(
                onPressed: () {
                  TzModalBottomSheet.showTzModalBottomSheet(context,
                      showTopBtn: true,
                      enableDrag: true,
                      sheetListWidget: [Text('测试')]);
                },
                child: Text('点击弹出sheetbuttom')),
            subTitle('NumberControllerWidget-自定义步数器组件'),
            TzStepNumber(
              enabled: false,
              addValueChanged: (value) {},
              removeValueChanged: (value) {},
              updateValueChanged: (value) {},
            ),
            subTitle('TzHorizontalBar-自定义可切换组件'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TzHorizontalBar(
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
            ),
            subTitle('TzDialog-自定义模态框组件'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
