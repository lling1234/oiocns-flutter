import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final List<Widget> _pages = [
    TabBarViewContainer(title: '首页1'),
    TabBarViewContainer(title: 'Console'),
    TabBarViewContainer(title: 'Dashboard'),
    TabBarViewContainer(title: 'News'),
    TabBarViewContainer(title: 'Shared'),
    TabBarViewContainer(title: 'Trade'),
  ];

  final List<Tab> _tabs = [
    Tab(text: '首页'),
    Tab(text: '控制台'),
    Tab(text: '看板'),
    Tab(text: '新闻'),
    Tab(text: '共享'),
    Tab(text: '交易'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}

class TabBarViewContainer extends StatelessWidget {
  final String title;

  TabBarViewContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text('$title Item ${index + 1}'),
        );
      },
    );
  }
}
