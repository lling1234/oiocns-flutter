import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orginone/dart/controller/setting/setting_controller.dart';
import 'package:orginone/dart/core/consts.dart';
import 'package:orginone/dart/core/target/authority/authority.dart';
import 'package:orginone/dart/core/target/base/target.dart';
import 'package:orginone/dart/core/thing/base/form.dart';
import 'package:orginone/dart/core/thing/base/species.dart';
import 'package:orginone/dart/core/thing/dict/dict.dart';
import 'package:orginone/dart/core/thing/store/propclass.dart';
import 'package:orginone/pages/setting/config.dart';
import 'package:orginone/widget/common_widget.dart';

import 'state.dart';


class PopupMenuWidget<T> extends StatefulWidget {
  final SettingNavModel model;
  final PopupMenuItemSelected<T>? onSelected;

  const PopupMenuWidget(
      {Key? key,
       required this.model,
      this.onSelected})
      : super(key: key);

  @override
  State<PopupMenuWidget> createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  var popupMenuItem = <PopupMenuItem>[];

  SettingController get settingController => Get.find<SettingController>();

  ITarget? target;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() {
    popupMenuItem.clear();
    target = (widget.model.source is ITarget)?widget.model.source:null;
    if(widget.model.spaceEnum!=null){
      if(widget.model.source==null){
        switch (widget.model.spaceEnum) {
          case SpaceEnum.innerAgency:
            popupMenuItem.add(newPopupMenuItem("新建部门", "create"));
            break;
          case SpaceEnum.outAgency:
            popupMenuItem.add(newPopupMenuItem("新建集团", "create"));
            break;
          case SpaceEnum.stationSetting:
            popupMenuItem.add(newPopupMenuItem("新建岗位", "create"));
            break;
          case SpaceEnum.personGroup:
          case SpaceEnum.externalCohort:
            popupMenuItem.add(newPopupMenuItem("新建群组", "create"));
            break;
        }
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await initPopupMenuItem();
      });
    }
    if(widget.model.standardEnum!=null){
      switch (widget.model.standardEnum) {
        case StandardEnum.permission:
          popupMenuItem.add(newPopupMenuItem("新增权限", "create"));
          if(widget.model.source != null){
            if ((widget.model.source as IAuthority)
                .hasAuthoritys([OrgAuth.relationAuthId.label])) {
              popupMenuItem.add(newPopupMenuItem("编辑权限", "edit"));
              popupMenuItem.add(newPopupMenuItem("删除权限", "delete"));
            }
          }
          break;
        case StandardEnum.classCriteria:
          if (widget.model.source != null) {
            if(widget.model.source is ISpeciesItem){
              if (widget.model.source.speciesTypes.isNotEmpty) {
                popupMenuItem.add(newPopupMenuItem("新增类别", "create"));
              }
              popupMenuItem.add(newPopupMenuItem("编辑分类", "edit"));
              popupMenuItem.add(newPopupMenuItem("删除分类", "delete"));
            }
            if(widget.model.source is IForm){
              popupMenuItem.add(newPopupMenuItem("编辑表单", "edit"));
              popupMenuItem.add(newPopupMenuItem("删除表单", "delete"));
            }
            if(widget.model.source is IDict){
              if(widget.model.source == null){
                popupMenuItem.add(newPopupMenuItem("新建字典", "create"));
              }else{
                popupMenuItem.add(newPopupMenuItem("编辑字典", "edit"));
                popupMenuItem.add(newPopupMenuItem("删除字典", "delete"));
              }
            }
            if(widget.model.source is IPropClass){
              popupMenuItem.add(newPopupMenuItem("新增属性", "create"));
              popupMenuItem.add(newPopupMenuItem("编辑属性", "edit"));
              popupMenuItem.add(newPopupMenuItem("删除属性", "delete"));
            }
          } else {
            popupMenuItem.add(newPopupMenuItem("新增类别", "create"));
          }
          break;
      }
    }
  }

  Future<bool> initPopupMenuItem() async {
    if (target == null) {
      return popupMenuItem.isNotEmpty;
    }
    bool isSuperAdmin = target!.hasAuthoritys([OrgAuth.relationAuthId.label]);
    if (target?.speciesTypes.isNotEmpty??false) {
      if (isSuperAdmin) {
        popupMenuItem.add(newPopupMenuItem("新建子组织", "create"));
      }
    }
    if (isSuperAdmin) {
      popupMenuItem.add(newPopupMenuItem("编辑", "edit"));
      if (target != settingController.user) {
        popupMenuItem.add(newPopupMenuItem("删除", "delete"));
      }
    }

    setState(() {});
    return popupMenuItem.isNotEmpty;
  }

  PopupMenuItem newPopupMenuItem(String text, String value) {
    return PopupMenuItem(
      child: Text(text),
      value: value,
    );
  }

  @override
  void didUpdateWidget(covariant PopupMenuWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != widget.model) {
      init();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(popupMenuItem.isEmpty){
      return Container();
    }
    return CommonWidget.commonPopupMenuButton(
      items: popupMenuItem,
      onSelected: widget.onSelected,
    );
  }
}
