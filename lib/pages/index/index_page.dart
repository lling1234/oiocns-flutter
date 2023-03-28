import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logging/logging.dart';
import 'package:orginone/components/template/base_view.dart';
import 'package:orginone/components/unified.dart';
import 'package:orginone/config/enum.dart';
import 'package:orginone/config/forms.dart';
import 'package:orginone/dart/base/model.dart';
import 'package:orginone/dart/controller/setting/setting_controller.dart';
import 'package:orginone/pages/index/HorizontalScrollMenu/MyMenuItem.dart';
import 'package:orginone/pages/other/home/components/operation_bar.dart';
import 'package:orginone/routers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'widgets/body_widget.dart';
import 'widgets/drawer_widget.dart';

// TODO 请求接口，接收数据，转化为 LinkedHashMap对象
//调试设备：pixel_6_pro(1440×3120)
/// 设置首页
@immutable
class IndexPage extends BaseView<IndexPageController> {
  final Logger log = Logger("IndexPage");

  final List<Tab> tabs = [
    const Tab(
      text: '首页',
    ),
    const Tab(
      text: '控制台',
    ),
    const Tab(
      text: '看板',
    ),
    const Tab(
      text: '新闻',
    ),
    const Tab(
      text: '共享',
    ),
    const Tab(
      text: '交易',
    ),
  ];
  final List<Widget> tabViews = [
    Container(
      child: const Text("首页home"),
    ),
    Container(
      child: const Text("控制台home"),
    ),
    Container(
      child: const Text("看板home"),
    ),
    Container(
      child: const Text("新闻home"),
    ),
    Container(
      child: const Text("共享home"),
    ),
    Container(
      child: const Text("交易home"),
    ),
  ];

  @override
  bool isUseScaffold() {
    return false;
  }

  @override
  LoadStatusX initStatus() {
    return LoadStatusX.success;
  }

  @override
  void dispose() {
    controller.tabController.dispose();
  }

// TODO 常用应用，超过五个字屏幕会越界
  IndexPage({Key? key}) : super(key: key) {}

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      drawer: DrawerwWidget(),
      appBar: _portalAppbar(),
      body: _portalBody(),
      // appBar: _appbar(),
      // body: BodyWidget(),
    );
  }

  Widget _drawer1(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'JD',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: XColors.navigatorBgColor,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         children: [
          //           IconButton(
          //             icon: Icon(Icons.file_download_done_outlined),
          //             onPressed: () {
          //               Navigator.pop(context); // 关闭Drawer
          //             },
          //           ),
          //           const Text(
          //             '今天还没打卡哦',
          //             style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 18,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 212.h,
          //           ),
          //           IconButton(
          //             icon: Icon(Icons.close),
          //             onPressed: () {
          //               Navigator.pop(context); // 关闭Drawer
          //             },
          //           ),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 22.h,
          //       ),
          //       Row(
          //         children: [
          //           SizedBox(
          //             width: 22.h,
          //           ),
          //           GFAvatar(
          //               size: GFSize.LARGE,
          //               backgroundImage: NetworkImage(
          //                   'https://s3.bmp.ovh/imgs/2023/02/28/3d1e012ec88ff534.jpg'),
          //               shape: GFAvatarShape.circle),
          //           SizedBox(
          //             width: 42.h,
          //           ),
          //           Column(
          //             children: [
          //               Text(
          //                 '昵称：凌志强',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 14,
          //                 ),
          //               ),
          //               Text(
          //                 '等级：999级',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 14,
          //                 ),
          //               ),
          //               Text(
          //                 '个性签名：物有本末，事有始终。',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 14,
          //                 ),
          //               )
          //             ],
          //           ),
          //           IconButton(
          //             icon: Icon(Icons.qr_code_scanner_outlined),
          //             onPressed: () {
          //               // Navigator.pop(context); // 关闭Drawer
          //               Get.toNamed(Routers.scanning);
          //             },
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // DrawerwWidget(),
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
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _portalAppbar() {
    return AppBar(
      bottom: TabBar(
        controller: controller.tabController,
        tabs: tabs,
      ),
    );
  }

  Widget _portalBody() {
    return TabBarView(
      controller: controller.tabController,
      children: tabViews,
    );
  }

  PreferredSizeWidget _appbar() {
    double x = 0, y = 0;
    return AppBar(
      toolbarHeight: 40,
      backgroundColor: XColors.navigatorBgColor,
      leading: Builder(builder: (context) {
        return GestureDetector(
          onPanDown: (position) {
            x = position.globalPosition.dx;
            y = position.globalPosition.dy;
          },
          onTap: () {
            print('处理点击事件');
            Scaffold.of(context).openDrawer();
            // Get.toNamed(Routers.mineUnit);
          },
          onLongPress: () {
            // 处理长按事件
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                x - 20.w,
                y + 20.h,
                x + 20.w,
                y + 40.h,
              ),
              items: _popupMenus(context),
            );
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        );
      }),
      // automaticallyImplyLeading: false,
      actions: <Widget>[OperationBar()],
    );
  }

  List<PopupMenuEntry> _popupMenus(BuildContext context) {
    return [
      PopupMenuItem(
        child: _popMenuItem(
          context,
          Icons.chat,
          "沟通",
          () async {
            Get.toNamed(Routers.mineUnit);
          },
        ),
      ),
      PopupMenuItem(
        child: _popMenuItem(
          context,
          Icons.calendar_month_outlined,
          "办事",
          () {
            Get.toNamed(
              Routers.form,
              arguments: CreateCohort((value) {
                if (Get.isRegistered<SettingController>()) {
                  Get.find<SettingController>()
                      .user
                      ?.create(TargetModel.fromJson(value))
                      .then((value) => Get.back());
                }
              }),
            );
          },
        ),
      ),
      PopupMenuItem(
        child: _popMenuItem(
          context,
          Icons.cabin,
          "仓库",
          () {
            Get.toNamed(
              Routers.form,
              arguments: CreateCompany((value) {
                if (Get.isRegistered<SettingController>()) {
                  Get.find<SettingController>()
                      .user
                      ?.create(TargetModel.fromJson(value))
                      .then((value) => Get.back());
                }
              }),
            );
          },
        ),
      ),
      PopupMenuItem(
        child: _popMenuItem(
          context,
          Icons.person_pin,
          "设置",
          () {
            Get.toNamed(
              Routers.form,
              arguments: CreateCompany((value) {
                if (Get.isRegistered<SettingController>()) {
                  Get.find<SettingController>()
                      .user
                      ?.create(TargetModel.fromJson(value))
                      .then((value) => Get.back());
                }
              }),
            );
          },
        ),
      ),
    ];
  }

  Widget _popMenuItem(
    BuildContext context,
    IconData icon,
    String text,
    Function func,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pop(context);
        func();
      },
      child: SizedBox(
        height: 40.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            Container(
              margin: EdgeInsets.only(left: 20.w),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class IndexPageController extends BaseController {
  late TabController tabController;

  @override
  void initState() async {
    tabController = TabController(length: 3, vsync: AnimatedListState());
  }

  @override
  void dispose() async {
    tabController.dispose();
    super.dispose();
  }
}

class IndexPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IndexPageController());
  }
}
