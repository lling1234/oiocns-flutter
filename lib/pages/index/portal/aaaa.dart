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
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  // Create a TabController for the tabs
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    // Dispose the TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tabbed Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Home',
            ),
            Tab(
              text: 'Contacts',
            ),
            Tab(
              text: 'Map',
            ),
            Tab(
              text: 'Settings',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Text("home"),
          ),
          Container(
            child: Text("Contacts"),
          ),
          Container(
            child: Text("Map"),
          ),
          Container(
            child: Text("Settings"),
          )
        ],
      ),
    );
  }
}
