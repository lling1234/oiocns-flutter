import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orginone/routers.dart';

/// 1.json数据，
/// [{"id":1,"icon":59475,"cardName":"加好友","func":"Routers.scanning"},{"id":2,"icon":59648,"cardName":"创单位1","func":"() => print('Go to search page')"},{"id":3,"icon":59574,"cardName":"邀成员","func":"() => print('Go to settings page')"},{"id":4,"icon":59648,"cardName":"建应用","func":"() => print('Go to profile page')"},{"id":5,"icon":59648,"cardName":"逛商店","func":"() => print('Go to search page')"},{"id":6,"icon":59574,"cardName":"通讯录","func":"() => print('Go to settings page')"},{"id":7,"icon":59648,"cardName":"创单位1","func":"() => print('Go to search page')"}]
/// [{\"id\":1,\"icon\":59475,\"cardName\":\"加好友\",\"func\":\"Routers.scanning\"},{\"id\":2,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"},{\"id\":3,\"icon\":59574,\"cardName\":\"邀成员\",\"func\":\"() => print('Go to settings page')\"},{\"id\":4,\"icon\":59648,\"cardName\":\"建应用\",\"func\":\"() => print('Go to profile page')\"},{\"id\":5,\"icon\":59648,\"cardName\":\"逛商店\",\"func\":\"() => print('Go to search page')\"},{\"id\":6,\"icon\":59574,\"cardName\":\"通讯录\",\"func\":\"() => print('Go to settings page')\"},{\"id\":7,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"}]
/// {\"code\":0,\"data\":[{\"id\":1,\"icon\":59475,\"cardName\":\"加好友\",\"func\":\"Routers.scanning\"},{\"id\":2,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"},{\"id\":3,\"icon\":59574,\"cardName\":\"邀成员\",\"func\":\"() => print('Go to settings page')\"},{\"id\":4,\"icon\":59648,\"cardName\":\"建应用\",\"func\":\"() => print('Go to profile page')\"},{\"id\":5,\"icon\":59648,\"cardName\":\"逛商店\",\"func\":\"() => print('Go to search page')\"},{\"id\":6,\"icon\":59574,\"cardName\":\"通讯录\",\"func\":\"() => print('Go to settings page')\"},{\"id\":7,\"icon\":59648,\"cardName\":\"创单位1\",\"func\":\"() => print('Go to search page')\"}],\"msg\":\"string\",\"success\":true}
/// {"code":0,"data":[{"id":1,"icon":59475,"cardName":"加好友","func":"Routers.scanning"},{"id":2,"icon":59648,"cardName":"创单位1","func":"() => print('Go to search page')"},{"id":3,"icon":59574,"cardName":"邀成员","func":"() => print('Go to settings page')"},{"id":4,"icon":59648,"cardName":"建应用","func":"() => print('Go to profile page')"},{"id":5,"icon":59648,"cardName":"逛商店","func":"() => print('Go to search page')"},{"id":6,"icon":59574,"cardName":"通讯录","func":"() => print('Go to settings page')"},{"id":7,"icon":59648,"cardName":"创单位1","func":"() => print('Go to search page')"}],"msg":"string","success":true}
/// 2.存入anystore，从anystore取出.
/// 3.根据取到的数据，加载快捷入口
class MenuItem {
  final int id;
  final IconData icon;
  final String cardName;
  final Function func;

  MenuItem(
      {required this.id,
      required this.icon,
      required this.cardName,
      required this.func});
}

List<MenuItem> decodeCardItems(String rspDataStr) {
  List<dynamic> jsonList = json.decode(rspDataStr);
  List<MenuItem> cardItems = jsonList
      .map((jsonMap) => MenuItem(
            id: jsonMap['id'],
            icon: jsonMap['icon'],
            cardName: jsonMap['cardName'],
            func: jsonMap['func'],
          ))
      .toList();
  return cardItems;
}

class MyHorizontalMenu extends StatefulWidget {
  const MyHorizontalMenu({super.key});

  @override
  _MyHorizontalMenuState createState() => _MyHorizontalMenuState();
}

class _MyHorizontalMenuState extends State<MyHorizontalMenu> {
  LinkedHashMap<int, MenuItem> menuItems = LinkedHashMap.from({
    1: MenuItem(
        id: 1,
        icon: Icons.add,
        cardName: '加好友',
        func: () {
          Get.toNamed(Routers.scanning);
          print('Go to home page');
        }),
    2: MenuItem(
        id: 2,
        icon: Icons.search,
        cardName: '创单位',
        func: () => print('Go to search page')),
    3: MenuItem(
        id: 3,
        icon: Icons.settings,
        cardName: '邀成员',
        func: () => print('Go to settings page')),
    4: MenuItem(
        id: 4,
        icon: Icons.person,
        cardName: '建应用',
        func: () => print('Go to profile page')),
    5: MenuItem(
        id: 5,
        icon: Icons.search,
        cardName: '逛商店',
        func: () => print('Go to search page')),
    6: MenuItem(
        id: 6,
        icon: Icons.settings,
        cardName: '通讯录',
        func: () => print('Go to settings page')),
    7: MenuItem(
        id: 7,
        icon: Icons.person,
        cardName: '创单位',
        func: () => print('Go to profile page')),
  });

  List<MenuItem> menuItemsArray = [
    MenuItem(
        id: 1,
        icon: const IconData(0xe567,
            fontFamily: 'MaterialIcons', matchTextDirection: true),
        cardName: '加好友',
        func: () {
          Get.toNamed(Routers.scanning);
          print('Go to home page');
        }),
    MenuItem(
        id: 2,
        icon: Icons.search,
        cardName: '创单位1',
        func: () => print('Go to search page')),
    MenuItem(
        id: 3,
        icon: Icons.settings,
        cardName: '邀成员',
        func: () => print('Go to settings page')),
    MenuItem(
        id: 4,
        icon: Icons.person,
        cardName: '建应用',
        func: () => print('Go to profile page')),
    MenuItem(
        id: 5,
        icon: Icons.search,
        cardName: '逛商店',
        func: () => print('Go to search page')),
    MenuItem(
        id: 6,
        icon: Icons.settings,
        cardName: '通讯录',
        func: () => print('Go to settings page')),
    MenuItem(
        id: 7,
        icon: Icons.person,
        cardName: '创单位',
        func: () => print('Go to profile page')),
  ];

  late int _selectedItemId;

  @override
  void initState() {
    super.initState();
    _selectedItemId = menuItemsArray[0].id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: ListView.builder(
        itemCount: menuItemsArray.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          print("index");
          print(index);
          // int itemId = menuItems.keys.elementAt(index);
          MenuItem? menuItem = menuItemsArray[index];
          print('1111111111111');
          // print(itemId);
          print(menuItem);
          print('2222222222222');

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedItemId = menuItem.id;
              });
              menuItem?.func();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: menuItem.id == _selectedItemId
                    ? Colors.blue
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(menuItem?.icon,
                      color: menuItem.id == _selectedItemId
                          ? Colors.white
                          : Colors.black),
                  SizedBox(height: 6),
                  Text(menuItem!.cardName,
                      style: TextStyle(
                          color: menuItem.id == _selectedItemId
                              ? Colors.white
                              : Colors.black)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
