import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Tab 1',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Tab 2',
              icon: Icon(Icons.settings),
            ),
            Tab(
              text: 'Tab 3',
              icon: Icon(Icons.notifications),
            ),
            Tab(
              child: Row(
                children: [
                  // Text('Tab 4'),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // handle settings button press
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('Tab 1 content'),
          ),
          Center(
            child: Text('Tab 2 content'),
          ),
          Center(
            child: Text('Tab 3 content'),
          ),
        ],
      ),
    );
  }
}
