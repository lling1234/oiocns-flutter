

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orginone/widget/gy_scaffold.dart';
import 'package:orginone/widget/unified.dart';

import 'base_breadcrumb_nav_controller.dart';
import 'base_get_breadcrumb_nav_state.dart';
import '../base_get_view.dart';

abstract class BaseBreadcrumbNavPage<T extends BaseBreadcrumbNavController,S extends BaseBreadcrumbNavState> extends BaseGetView<T,S>{

  TextStyle get _selectedTextStyle =>
  TextStyle(fontSize: 20.sp, color: XColors.themeColor);

  TextStyle get _unSelectedTextStyle =>
  TextStyle(fontSize: 20.sp, color: Colors.black);

  @override
  Widget buildView() {
    return GyScaffold(
      leadingWidth: 0,
      leading: const SizedBox(),
      centerTitle: false,
      titleWidget: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: LayoutBuilder(builder: (context, type) {
          List<Widget> nextStep = [];
          if (state.bcNav.isNotEmpty) {
            for (var value in state.bcNav) {
               if(value != state.bcNav.first){
                 nextStep.add(_level(value));
               }
            }
          }
          return SingleChildScrollView(
            controller: state.navBarController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.pop(0);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child:GestureDetector(
                              onTap: (){
                                controller.popAll();
                              },
                              child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                            ),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                            text: state.bcNav.first.title,
                            style: state.bcNav.isEmpty
                                ? _selectedTextStyle
                                : _unSelectedTextStyle)
                      ],
                    ),
                  ),
                ),
                ...nextStep,
              ],
            ),
          );
        }),
      ),
      body: body(),
    );
  }


  Widget _level(BaseBreadcrumbNavInfo info) {
    int index = state.bcNav.indexOf(info);
    return GestureDetector(
      onTap: () {
        controller.pop(index);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: " • ",
                style: _unSelectedTextStyle),
            TextSpan(
                text: info.title,
                style: index == state.bcNav.length - 1
                    ? _selectedTextStyle
                    : _unSelectedTextStyle),
          ],
        ),
      ),
    );
  }

  Widget body();
}