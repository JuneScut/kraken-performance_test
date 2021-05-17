import 'package:flutter/material.dart';
import 'package:kraken/kraken.dart';
import 'package:kraken_websocket/kraken_websocket.dart';
import 'dart:ui';

void main() {
  KrakenWebsocket.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kraken Browser',
      // theme: ThemeData.dark(),
      home: MyBrowser(),
    );
  }
}

class MyBrowser extends StatefulWidget {
  MyBrowser({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBrowser> {
  var current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kraken'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$current"),
            RaisedButton(
              onPressed: () {
                var c =  DateTime.now().millisecondsSinceEpoch;
                setState(()  {
                  current = c;
                });
                print(
                    'ellilachen, normal case, startTime=${c}');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NormalTest()));
              },
              child: Text('普通页面测试'),
            ),
            RaisedButton(
              onPressed: () {
                var c =  DateTime.now().millisecondsSinceEpoch;
                setState(() {
                  current = c;
                });
                print(
                    'ellilachen, case1, startTime=${c}');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScrollTest()));
              },
              child: Text('case1: 长列表scroll基准测试'),
            ),
            RaisedButton(
              onPressed: () {
                var c =  DateTime.now().millisecondsSinceEpoch;
                setState(() {
                  current = c;
                });
                print(
                    'ellilachen, case2, startTime=${c}');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SliverTest()));
              },
              child: Text('case2: 长列表sliver基准测试'),
            ),
            RaisedButton(
              onPressed: () {
                var c =  DateTime.now().millisecondsSinceEpoch;
                setState(() {
                  current = c;
                });
                print(
                    'ellilachen, case3, startTime=${c}');
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnimationTest()));
              },
              child: Text('case3: 动画基准测试'),
            ),
            RaisedButton(
              onPressed: () {
                var c =  DateTime.now().millisecondsSinceEpoch;
                setState(() {
                  current = c;
                });
                print(
                    'ellilachen, case4, startTime=${c}');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DragTest()));
              },
              child: Text('case4: 拖拽基准测试'),
            )
          ],
        ),
      ),
    );
  }
}

class NormalTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    final appBar = AppBar(
      title: Text('normal case'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Kraken(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height -
              appBar.preferredSize.height -
              queryData.padding.vertical,
          bundlePath: 'assets/normal.js',
        ),
      ),
    );
  }
}

class ScrollTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    final appBar = AppBar(
      title: Text('case1'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Kraken(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height -
              appBar.preferredSize.height -
              queryData.padding.vertical,
          bundlePath: 'assets/scroll.js',
        ),
      ),
    );
  }
}

class SliverTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    final appBar = AppBar(
      title: Text('case2'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Kraken(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height -
              appBar.preferredSize.height -
              queryData.padding.vertical,
          bundlePath: 'assets/sliver.js',
        ),
      ),
    );
  }
}

class AnimationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    final appBar = AppBar(
      title: Text('case3'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Kraken(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height -
              appBar.preferredSize.height -
              queryData.padding.vertical,
          bundlePath: 'assets/animation.js',
        ),
      ),
    );
  }
}

class DragTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    final appBar = AppBar(
      title: Text('case4'),
    );

    return Scaffold(
      appBar: appBar,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Kraken(
          viewportWidth: viewportSize.width - queryData.padding.horizontal,
          viewportHeight: viewportSize.height -
              appBar.preferredSize.height -
              queryData.padding.vertical,
          bundlePath: 'assets/drag.js',
        ),
      ),
    );
  }
}
