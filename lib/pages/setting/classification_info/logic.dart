import 'package:flutter/material.dart' hide Form;
import 'package:get/get.dart';
import 'package:orginone/dart/controller/setting/setting_controller.dart';

import '../../../dart/core/getx/base_controller.dart';
import 'attrs.dart';
import 'form.dart';
import 'property.dart';
import 'state.dart';
import 'work.dart';

SettingController get setting => Get.find();

class ClassificationInfoController
    extends BaseController<ClassificationInfoState>
    with GetTickerProviderStateMixin {
  final ClassificationInfoState state = ClassificationInfoState();

  ClassificationInfoController() {
    state.tabController =
        TabController(length: state.tabTitle.length, vsync: this);
  }

  void changeIndex(int index) {
    if (index != state.currentIndex.value) {
      state.currentIndex.value = index;
    }
  }

  void create(ClassificationEnum classificationEnum) {
    switch (classificationEnum) {
      case ClassificationEnum.attrs:
        var controller = Get.find<AttrsController>(tag: "attr");
        controller.createAttr();
        break;
      case ClassificationEnum.form:
        var controller = Get.find<FormController>(tag: "form");
        // controller.createForm();
        break;
      case ClassificationEnum.work:
        var controller = Get.find<WorkController>(tag: "work");
        controller.createWork();
        break;
      case ClassificationEnum.property:
        var controller = Get.find<PropertyController>(tag: "property");
        controller.createProperty();
        break;
    }
  }
}
