import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:orginone/components/unified.dart';
import 'package:orginone/pages/index/HorizontalScrollMenu/MyMenuItem.dart';
import 'package:orginone/pages/index/widgets/chart_widget.dart';
import 'package:orginone/routers.dart';

class BodyWidget extends StatelessWidget {
  // 轮播图片
  List<String> imageList = [
    "images/bg_center1.png",
    "images/bg_center2.png",
    "images/bg_center1.png",
    "images/bg_center2.png",
  ];

  LinkedHashMap map = LinkedHashMap();

  BodyWidget({Key? key}) : super(key: key) {
    map["常用应用"] = [
      {
        "id": 0,
        "icon": "icon",
        "cardName": "资产应用一",
        "func": () {
          Get.toNamed(Routers.scanning);
          print('Go to home page');
        }
      },
      {"id": 1, "icon": "icon", "cardName": "资产应用2"},
      {"id": 2, "icon": "icon", "cardName": "资产应用3"},
      {"id": 4, "icon": "icon", "cardName": "资产应用4"},
      {"id": 5, "icon": "icon", "cardName": "资产应用5"},
      {"id": 6, "icon": "icon", "cardName": "资产应用6"},
      {
        "id": 7,
        "icon": "icon",
        "cardName": "资产应用7",
        "func": () async {
          // Get.toNamed(Routers.version);
        },
      },
      {"id": 8, "icon": "icon", "cardName": "资产应用8"},
      {"id": 9, "icon": "icon", "cardName": "资产应用9"},
      {"id": 10, "icon": "icon", "cardName": "资产应用10"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return ListView(
        scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          _carousel(imageList),
          _ExpressEntrance(),
          _CommonApplications(),
          ChartWidget()
          // _dataMonitoring(),
        ]);
  }

  Widget _ExpressEntrance() {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: XColors.white, borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 12.h,
            )),
        Container(
            decoration: BoxDecoration(
                color: XColors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.fromLTRB(11.0, 0, 0, 0),
            alignment: Alignment.topLeft,
            child: const Text("快捷入口")),
        // HorizontalMenu(),
        // MyHorizontalMenu(),
        MyHorizontalMenu(),
        Container(
            decoration: BoxDecoration(
                color: XColors.white, borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 12.h,
            )),
      ],
    );
  }

  List<Widget> _getItems() {
    List<Widget> children = [];
    debugPrint("--->size:${map.length}");
    map.forEach((key, value) {
      children.add(CardChildWidget(key, value));
    });
    return children;
  }

  Widget _CommonApplications() {
    return Container(
      color: XColors.bgColor,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: ListView(
        shrinkWrap: true,
        children: _getItems()..add(Container(
            // margin:
            //     EdgeInsets.only(left: 20.w, bottom: 10.h, right: 20.w),
            )),
      ),
    );
  }

  /// Carousel 轮播图
  ///
  ///  @param List<String> imageList
  ///
  ///  @returns Widget
  Widget _carousel(List<String> imageList) {
    return GFCarousel(
      //是否显示圆点
      hasPagination: true,
      // 宽高比，跑马灯郑哥区域的宽高比。设置高度后这个参数无效。默认16/9
      aspectRatio: 7 / 2,
      //选中的圆点颜色
      activeIndicator: GFColors.WHITE,
      // 自动播放
      autoPlay: true,
      items: imageList.map(
        (img) {
          return Container(
            // margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(img, fit: BoxFit.fill, width: 1000.0),
            ),
          );
        },
      ).toList(),
      // TODO 点击按钮跳转
      // onPageChanged: (index) {
      //   setState(() {
      //     index;
      //   });
      // },
    );
  }
}

class CardChildWidget extends StatelessWidget {
  String itemName;

  List value;

  CardChildWidget(this.itemName, this.value);

  @override
  Widget build(BuildContext context) {
    debugPrint("--->key:item$itemName | value :${value}");
    return Container(
        color: XColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              // style: XFonts.size24Black3W700,
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              // color: XColors.navigatorBgColor,

              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                  shrinkWrap: true,
                  itemCount: value.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        var func = value[index]["func"];
                        if (func != null) {
                          func();
                        }
                      },
                      child: Column(
                        children: [
                          // AImage.netImageRadius(AIcons.back_black,
                          //     size: Size(64.w, 64.w)),
                          Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: NetworkImage(
                              //         'https://s3.bmp.ovh/imgs/2023/02/28/3d1e012ec88ff534.jpg')),
                              borderRadius: BorderRadius.circular(60),
                              color: XColors.navigatorBgColor,
                            ),
                            width: 64.w,
                            height: 64.w,
                            // color: XColors.navigatorBgColor,
                          ),
                          // AImage.netImage(AIcons.placeholder,
                          //     url: value[index]['icon'], size: Size()),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            value[index]['cardName'],
                            style: XFonts.size18Black6,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
