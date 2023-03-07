import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orginone/routers.dart';

class MyMenuItem {
  final int id;
  final IconData icon;
  final String cardName;
  final Function func;

  MyMenuItem(
      {required this.id,
      required this.icon,
      required this.cardName,
      required this.func});
}

void main(List<String> args) {
  List<MyMenuItem> menuItemsArray = [
     MyMenuItem(
      id: 1,
      icon: Icons.add,
      cardName: '加好友',
      func: () {
        Get.toNamed(Routers.scanning);
        print('Go to home page');
      }),
     MyMenuItem(
      id: 2,
      icon: Icons.search,
      cardName: '创单位',
      func: () => print('Go to search page')),
     MyMenuItem(
      id: 3,
      icon: Icons.settings,
      cardName: '邀成员',
      func: () => print('Go to settings page')),
     MyMenuItem(
      id: 4,
      icon: Icons.person,
      cardName: '建应用',
      func: () => print('Go to profile page')),
     MyMenuItem(
      id: 5,
      icon: Icons.search,
      cardName: '逛商店',
      func: () => print('Go to search page')),
     MyMenuItem(
      id: 6,
      icon: Icons.settings,
      cardName: '通讯录',
      func: () => print('Go to settings page')),
     MyMenuItem(
        id: 7,
        icon: Icons.person,
        cardName: '创单位',
        func: () => print('Go to profile page')),
  ];
  print('1111');
  menuItemsArray.forEach((menuItem) {
  print(menuItem.id);
  print(menuItem.icon);
  print(menuItem.cardName);
  print(menuItem.func);
});

}

class printmenuItemsArray{}