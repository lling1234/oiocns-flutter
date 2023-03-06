import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic ListTile Demo',
      home: DynamicListTileDemo(),
    );
  }
}

class DynamicListTileDemo extends StatelessWidget {
  // 测试数据
  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'icon': Icons.person,
      'name': 'John',
      'func': () {
        print('object');
      }
    },
    {'id': 2, 'icon': Icons.person, 'name': 'Jane'},
    {'id': 3, 'icon': Icons.person, 'name': 'Bob'},
    {'id': 3, 'icon': Icons.person, 'name': 'Bob'},
    {'id': 3, 'icon': Icons.person, 'name': 'Bob'},
    {'id': 3, 'icon': Icons.person, 'name': 'Bob'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic ListTile Demo'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(items[index]['icon']),
            title: Text('${items[index]['id']}. ${items[index]['name']}'),
            onTap: () {
              var func = items[index]['func'];
              if (func != null) {
                func();
              }
            },
          );
        },
      ),
    );
  }
}
