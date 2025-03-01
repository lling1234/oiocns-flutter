


import 'package:get/get.dart';
import 'package:orginone/dart/base/model.dart';
import 'package:orginone/dart/base/schema.dart';
import 'package:orginone/dart/core/enum.dart';
import 'package:orginone/dart/core/target/person.dart';
import 'package:orginone/dart/core/thing/app/application.dart';
import 'package:orginone/dart/core/thing/base/flow.dart';
import 'package:orginone/dart/core/thing/market/market.dart';
import 'package:orginone/main.dart';


abstract class IWorkProvider {
  /// 当前用户
  late IPerson user;

  /// 待办
  late RxList<XWorkTask> todos;

  /// 加载待办任务
  Future<List<XWorkTask>> loadTodos({bool reload = false});

  /// 加载已办任务
  Future<List<XWorkRecord>> loadDones(String id);

  /// 加载我发起的办事任务
  Future<List<XWorkTask>> loadApply(String id);

  /// 任务更新
  void updateTask(XWorkTask task);

  /// 任务审批
  Future<bool> approvalTask(List<XWorkTask> tasks, int status,
      {String? comment, String? data});

  /// 查询任务明细
  Future<XWorkInstance?> loadTaskDetail(XWorkTask task);

  /// 查询流程定义
  Future<IWorkDefine?> findFlowDefine(String defineId);

  ///删除办事实例
  Future<bool> deleteInstance(String id);

  ///根据表单id查询表单特性
  Future<List<XAttribute>> loadAttributes(String id, String belongId);

  ///根据字典id查询字典项
  Future<List<XDictItem>> loadItems(String id);
}

class WorkProvider implements IWorkProvider{


  WorkProvider(this.user){
    todos = <XWorkTask>[].obs;
    kernel.on('RecvTask', (data) {
      var work = XWorkTask.fromJson(data);
      updateTask(work);
    });
  }

  @override
  late RxList<XWorkTask> todos;

  @override
  late IPerson user;

  @override
  Future<bool> approvalTask(List<XWorkTask> tasks, int status, {String? comment, String? data})async {
    bool success = true;
    for (final task in tasks) {
      if (task.status < TaskStatus.approvalStart.status) {
        if (status == -1) {
          success = (await kernel.recallWorkInstance(IdReq(id: task.id))).success;
        } else {
          success = (await kernel.approvalTask(ApprovalTaskReq(id: task.id,status: status,comment: comment,data: data))).success;
        }
        if(success){
          todos.removeWhere((element) => element.id == task.id);
          todos.refresh();
        }
      }
    }
    return success;
  }

  @override
  Future<IWorkDefine?> findFlowDefine(String defineId) async{
    for (final target in user.targets) {
      for (final species in target.species) {
        final defines = <IWorkDefine>[];
        switch (SpeciesType.getType(species.metadata.typeName)) {
          case SpeciesType.market:
            defines.addAll(await (species as IMarket).loadWorkDefines());
            break;
          case SpeciesType.application:
            defines.addAll(await (species as IApplication).loadWorkDefines());
            break;
        }
        for (final define in defines) {
          if (define.metadata.id == defineId) {
            return define;
          }
        }
      }
    }
    return null;
  }

  @override
  Future<List<XWorkTask>> loadApply(String id) async{
    return (await kernel.queryMyApply(IdReq(id: id))).data?.result??[];
  }

  @override
  Future<List<XWorkRecord>> loadDones(String id) async{
    return (await kernel.queryWorkRecord(IdReq(id: id))).data?.result??[];
  }

  @override
  Future<XWorkInstance?> loadTaskDetail(XWorkTask task) async{
    final res = await kernel.queryWorkInstanceById(IdReq(id: task.instanceId));
    return res.data;
  }

  @override
  Future<List<XWorkTask>> loadTodos({bool reload = false}) async{
    if (todos.isEmpty || reload) {
      final res = await kernel.queryApproveTask(IdReq(id: '0'));
      if (res.success) {
        todos.clear();
        todos.addAll(res.data?.result??[]);
        todos.refresh();
      }
    }
    return todos;
  }

  @override
  void updateTask(XWorkTask task) {
    final index = todos.indexWhere((i) => i.id == task.id);
    if (task.status != TaskStatus.approvalStart.status) {
      if (index < 0) {
        todos.insert(0, task);
      } else {
        todos[index] = task;
      }
    } else if (index > -1) {
      todos.removeAt(index);
    }
    todos.refresh();
  }

  @override
  Future<bool> deleteInstance(String id) async {
    var res = await kernel.recallWorkInstance(IdReq(id: id));
    return res.success;
  }

  @override
  Future<List<XAttribute>> loadAttributes(String id, String belongId) async {
    var res = await kernel.queryFormAttributes(GainModel(
      id: id,
      subId: belongId,
    ));
    if (res.success) {
      return res.data?.result ?? [];
    }
    return [];
  }

  @override
  Future<List<XDictItem>> loadItems(String id) async{
    var res = await kernel.queryDictItems(IdReq(id: id));
    if (res.success) {
      return res.data?.result ?? [];
    }
    return [];
  }
}