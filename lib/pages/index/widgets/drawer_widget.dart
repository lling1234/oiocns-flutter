import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:orginone/components/unified.dart';
import 'package:orginone/routers.dart';
// TODO CustomDrawerItem 生成元素报错
class DrawerwWidget extends StatelessWidget {
  DrawerwWidget({super.key});

  List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'icon': Icons.favorite,
      'name': '收藏',
      'func': () {
        print('object');
      }
    },
    {
      'id': 2,
      'icon': Icons.wallet,
      'name': '钱包',
      'func': () {
        print('object');
      }
    },
    {
      'id': 3,
      'icon': Icons.insert_drive_file_sharp,
      'name': '文件',
      'func': () {
        print('object');
      }
    },
    {
      'id': 4,
      'icon': Icons.source,
      'name': '资源',
      'func': () {
        print('object');
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: _DynamicListTiles(),
    );
  }

  Widget _DrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: XColors.navigatorBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.file_download_done_outlined),
                onPressed: () {
                  Navigator.pop(context); // 关闭Drawer
                },
              ),
              const Text(
                '今天还没打卡哦',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 212.h,
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // 关闭Drawer
                },
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 22.h,
              ),
              GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage: NetworkImage(
                      'https://s3.bmp.ovh/imgs/2023/02/28/3d1e012ec88ff534.jpg'),
                  shape: GFAvatarShape.circle),
              SizedBox(
                width: 42.h,
              ),
              Column(
                children: [
                  Text(
                    '昵称：凌志强',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '等级：999级',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '个性签名：物有本末，事有始终。',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner_outlined),
                onPressed: () {
                  // Navigator.pop(context); // 关闭Drawer
                  Get.toNamed(Routers.scanning);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _DynamicListTiles() {
    print('1111111111_DynamicListTiles');
    print(items);
    return ListView.builder(
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
    );
  }
}

List<Widget> _listTitles(BuildContext context) {
  return [
    ListTile(
      leading: const Icon(Icons.favorite),
      title: const Text('收藏'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    ListTile(
      leading: const Icon(Icons.wallet),
      title: const Text('钱包'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    ListTile(
      leading: const Icon(Icons.insert_drive_file_sharp),
      title: const Text('文件'),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    ListTile(
      leading: const Icon(Icons.source),
      title: const Text('资源'),
      onTap: () {
        Navigator.pop(context);
      },
    )
  ];
}

// ----------------------------------------------------------------
// _drawer组件拆分 start
// DrawerHeader 组件
class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: XColors.navigatorBgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.file_download_done_outlined),
                onPressed: () {
                  Navigator.pop(context); // 关闭Drawer
                },
              ),
              const Text(
                '今天还没打卡哦',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 212.h,
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // 关闭Drawer
                },
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 22.h,
              ),
              GFAvatar(
                  size: GFSize.LARGE,
                  backgroundImage: NetworkImage(
                      'https://s3.bmp.ovh/imgs/2023/02/28/3d1e012ec88ff534.jpg'),
                  shape: GFAvatarShape.circle),
              SizedBox(
                width: 42.h,
              ),
              Column(
                children: [
                  Text(
                    '昵称：凌志强',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '等级：999级',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '个性签名：物有本末，事有始终。',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner_outlined),
                onPressed: () {
                  // Navigator.pop(context); // 关闭Drawer
                  Get.toNamed(Routers.scanning);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  List<Map<String, dynamic>> items = [];
  CustomDrawerItem({Key? key}) : super(key: key) {
    items = [
      {
        'id': 1,
        'icon': Icons.favorite,
        'name': '收藏',
        'func': () {
          print('object');
        }
      },
      {
        'id': 2,
        'icon': Icons.wallet,
        'name': '钱包',
        'func': () {
          print('object');
        }
      },
      {
        'id': 3,
        'icon': Icons.insert_drive_file_sharp,
        'name': '文件',
        'func': () {
          print('object');
        }
      },
      {
        'id': 4,
        'icon': Icons.source,
        'name': '资源',
        'func': () {
          print('object');
        }
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[CustomDrawerHeader(), CustomDrawerItem().build(context)],
        ));
  }
}
// _drawer组件拆分 end
