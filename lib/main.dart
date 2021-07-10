import 'package:flutter/material.dart';
import 'package:news_app/app/pages/articles_page/articles_page_view.dart';
import 'package:news_app/app/theme/theme_lib.dart';

import 'app/injection_setup.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

final IInjectionSetup DI = InjectionSetup.Instance;

void main() async{
  DI.setup();
  await Future.delayed(Duration(milliseconds: 200));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppText.appTtile,
        theme: AppTheme.primaryTheme,
        navigatorKey: navigatorKey,
        home: ArticlesPageView(),
);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
