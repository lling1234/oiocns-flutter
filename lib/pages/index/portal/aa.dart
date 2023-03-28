import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBarView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TabBarView Demo'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text('首页'),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text('控制台'),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('看板'),
            ),
          ),
          Container(
            color: Colors.red,
            child: Center(
              child: Text('新闻'),
            ),
          ),
          Container(
            color: Colors.purple,
            child: Center(
              child: Text('共享'),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Center(
              child: Text('交易'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            text: '首页',
          ),
          Tab(
            icon: Icon(Icons.dashboard),
            text: '控制台',
          ),
          Tab(
            icon: Icon(Icons.dashboard),
            text: '看板',
          ),
          Tab(
            icon: Icon(Icons.new_releases),
            text: '新闻',
          ),
          Tab(
            icon: Icon(Icons.share),
            text: '共享',
          ),
          Tab(
            icon: Icon(Icons.compare_arrows),
            text: '交易',
          ),
        ],
      ),
    );
  }
}
