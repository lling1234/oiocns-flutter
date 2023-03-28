import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter TabBarView Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
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
        title: Text(widget.title),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: "首页"),
            Tab(text: "控制台",iconMargin :const EdgeInsets.only(bottom: 25.0),),
            Tab(icon: Icon(Icons.dashboard), text: "看板"),
            Tab(icon: Icon(Icons.new_releases), text: "News"),
            Tab(icon: Icon(Icons.share), text: "Share"),
            Tab(icon: Icon(Icons.swap_horiz), text: "Trade"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(
              child: Text("Home Page"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Dashboard Page"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Kanban Page"),
            ),
          ),
          Container(
            child: Center(
              child: Text("News Page"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Share Page"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Trade Page"),
            ),
          ),
        ],
      ),
    );
  }
}
