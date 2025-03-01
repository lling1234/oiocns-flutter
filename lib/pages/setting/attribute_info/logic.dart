import 'package:orginone/dart/base/model.dart';
import 'package:orginone/dart/base/schema.dart';
import 'package:orginone/dart/core/getx/base_controller.dart';
import 'package:orginone/dart/core/thing/dict/dict.dart';
import 'package:orginone/pages/setting/dialog.dart';
import 'package:orginone/util/toast_utils.dart';
import 'package:orginone/widget/loading_dialog.dart';

import 'state.dart';

class AttributeInfoController extends BaseController<AttributeInfoState> {
  final AttributeInfoState state = AttributeInfoState();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    LoadingDialog.showLoading(context);
    var res = await state.data.source
        .loadProperty(PageRequest(offset: 0, limit: 1000, filter: ''));
    state.propertys.addAll(res?.result ?? []);
    LoadingDialog.dismiss(context);
  }

  void onOperation(operation, String code) async {
    try {
      var property =
          state.propertys.firstWhere((element) => element.code == code);

      if (operation == "edit") {
       var dictArray = await state.data.source.loadDict(PageRequest(offset: 0, limit: 1000, filter: ''));
        showCreateAttributeDialog(context,
            onCreate: (name, code, type, remark,unit,dict) async {
         var pro = await state.data.source.updateProperty(PropertyModel(
              id: property.id,
              name: name,
              code: code,
              valueType: type,
              remark: remark,
              dictId: dict==null?property.dictId:dict.metadata.id,
             ));
         if(pro!=null){
           property.name = name;
           property.code = code;
           property.valueType = type;
           property.remark = remark;
           property.unit = unit;
           property.dict = dict as XDict?;
           state.propertys.refresh();
           ToastUtils.showMsg(msg: "修改成功");
         }else{
           ToastUtils.showMsg(msg: "修改失败");
         }
        },
            name: property.name ?? "",
            code: property.code ?? "",
            remark: property.remark ?? "",
            valueType: property.valueType ?? "",
            unit: property.unit??"",
            dictId: property.dict?.id,
            isEdit: true,dictList: dictArray.result??[]);
      } else if (operation == 'delete') {
        bool success =
            await state.data.source.deleteProperty(property.id!);
        if (success) {
          state.propertys.remove(property);
          state.propertys.refresh();
          ToastUtils.showMsg(msg: "删除成功");
        } else {
          ToastUtils.showMsg(msg: "删除失败,属性正在使用,无法删除!");
        }
      }
    } catch (e) {}
  }
}
