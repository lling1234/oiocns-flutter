import 'package:orginone/dart/base/model.dart';
import 'package:orginone/dart/base/schema.dart';
import 'package:orginone/dart/core/chat/message/msgchat.dart';
import 'package:orginone/dart/core/enum.dart';
import 'package:orginone/dart/core/target/base/target.dart';
import 'package:orginone/dart/core/target/base/team.dart';
import 'package:orginone/dart/core/target/team/company.dart';
import 'package:orginone/dart/core/thing/app/application.dart';
import 'package:orginone/dart/core/thing/market/market.dart';
import 'package:orginone/main.dart';

/// 单位群接口
abstract class IGroup implements ITarget {
  /// 加载单位群的单位
  late ICompany company;

  /// 父级单位群
  IGroup? parent;

  /// 子单位群
  late List<IGroup> children;

  /// 流通交易
  IMarket? get market;

  /// 加载子单位群
  Future<List<IGroup>> loadChildren({bool reload = false});

  /// 设立子单位群
  Future<IGroup?> createChildren(TargetModel data);
}

class Group extends Target implements IGroup {
  @override
  late List<IGroup> children;

  @override
  late ICompany company;

  @override
  IGroup? parent;

  Group(XTarget metadata, this.company)
      : super(metadata, [metadata.belong?.name ?? '', '单位群'], space: company) {
    children = [];
    speciesTypes.add(SpeciesType.market);
    memberTypes = companyTypes;
  }

  @override
  // TODO: implement chats
  List<IMsgChat> get chats {
    List<IMsgChat> chats = [this];
    for (final item in children) {
      chats.addAll(item.chats);
    }
    return chats;
  }

  @override
  Future<IGroup?> createChildren(TargetModel data) async {
    data.typeName = TargetType.group.label;
    final metadata = await create(data);
    if (metadata != null) {
      final group = Group(metadata, company);
      children.add(group);
      return group;
    }
    return null;
  }

  @override
  Future<ITeam?> createTarget(TargetModel data) async {
    return await createChildren(data);
  }

  @override
  Future<void> deepLoad({bool reload = false}) async {
    await loadChildren(reload: reload);
    await loadMembers(reload: reload);
    await loadSpecies(reload: reload);
    for (var group in children) {
      await group.deepLoad(reload: reload);
    }
  }

  @override
  Future<bool> delete() async {
    final res = await kernel.deleteTarget(IdReq(id: metadata.id));
    if (res.success) {
      if (parent != null) {
        parent!.children.removeWhere((i) => i != this);
      } else {
        company.groups.removeWhere((i) => i != this);
      }
    }
    return res.success;
  }

  @override
  Future<bool> exit() async {
    if (metadata.belongId != company.metadata.id) {
      if (await removeMembers([company.metadata])) {
        if (parent != null) {
          parent!.children.removeWhere((i) => i != this);
        } else {
          company.groups.removeWhere((i) => i != this);
        }
        return true;
      }
    }
    return false;
  }

  @override
  Future<List<IGroup>> loadChildren({bool reload = false}) async {
    if (children.isEmpty || reload == true) {
      final res = await kernel.querySubTargetById(GetSubsModel(
        id: metadata.id,
        subTypeNames: [TargetType.group.label],
        page: PageRequest(offset: 0, limit: 9999, filter: ''),
      ));
      if (res.success) {
        children =
            (res.data?.result ?? []).map((i) => Group(i, company)).toList();
      }
    }
    return children;
  }

  @override
  // TODO: implement subTarget
  List<ITarget> get subTarget => children;

  @override
  // TODO: implement workSpecies
  List<IApplication> get workSpecies {
    return species
        .where((a) => a.metadata.typeName == SpeciesType.application.label)
        .cast<IApplication>()
        .toList();
  }

  @override
  // TODO: implement market
  IMarket? get market {
    try {
      final find = species
          .firstWhere((i) => i.metadata.typeName == SpeciesType.market.label);
      return find as IMarket?;
    } catch (e) {
      return null;
    }
  }

  @override
  // TODO: implement targets
  List<ITarget> get targets {
    List<ITarget> targets = [this];
    for (var item in children) {
      targets.addAll(item.targets);
    }
    return targets;
  }
}
