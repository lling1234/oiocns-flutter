import 'package:get/get.dart';
import 'package:orginone/dart/core/thing/base/species.dart';
import 'package:orginone/routers.dart';

import '../../../../../dart/core/getx/base_controller.dart';
import 'state.dart';

class ChoiceGbController extends BaseController<ChoiceGbState> {
  final ChoiceGbState state = ChoiceGbState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.searchController.addListener(() {
      if (state.searchController.text.isNotEmpty) {
        state.showSearchPage.value = true;
        search(state.searchController.text);
      } else {
        state.showSearchPage.value = false;
      }
    });
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
  }

  void search(String str) {
    state.searchList.clear();


    List<ISpeciesItem> allList = [];

    for (var value in state.gb) {
      // allList.addAll(value.c);
    }
    var filter = allList.where((element) => (element.metadata.name.contains(str)));
    if (filter!=null && filter.isNotEmpty) {
      state.searchList.addAll(filter);
    }
  }

  void removeGroup(int index) {
    state.selectedGroup.removeRange(index+1, state.selectedGroup.length);
    state.selectedGroup.refresh();
  }

  void back() {
    Get.back();
  }

  void selectGroup(ISpeciesItem item) {
    state.selectedGroup.add(item);
  }

  void onTap(ISpeciesItem item) {
    switch(state.function){
      case GbFunction.work:
        Get.toNamed(Routers.workStart,arguments: {"species":item});
        break;
      case GbFunction.wareHouse:
        Get.toNamed(Routers.thing,
            arguments: {"id": item.metadata.id, "title": item.metadata.name});
        break;
    }
  }
}

