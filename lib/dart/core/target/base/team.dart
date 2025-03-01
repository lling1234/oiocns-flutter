import 'package:orginone/dart/base/model.dart';
import 'package:orginone/dart/base/schema.dart';
import 'package:orginone/dart/core/chat/message/msgchat.dart';
import 'package:orginone/dart/core/enum.dart';
import 'package:orginone/dart/core/target/base/belong.dart';
import 'package:orginone/main.dart';

import 'team.dart';

abstract class ITeam extends IMsgChat {
  String get id;

  //加载用户的自归属用户
  late IBelong space;

  //数据实体
  late XTarget metadata;

  //限定成员类型
  late List<TargetType> memberTypes;

  //用户相关的所有会话
  List<IMsgChat> get chats;

  //深加载
  Future<void> deepLoad({bool reload = false});

  //创建用户
  Future<ITeam?> createTarget(TargetModel data);

  //更新团队信息
  Future<bool> update(TargetModel data);

  //删除(注销)团队
  Future<bool> delete();

  //用户拉入新成员
  Future<bool> pullMembers(List<XTarget> members);

  //用户移除成员
  Future<bool> removeMembers(List<XTarget> members);

  //加载成员会话
  void loadMemberChats(List<XTarget> members, bool isAdd);

  bool hasAuthoritys(List<String> authIds);

  void recvTarget(String operate,bool isChild,XTarget target);
}

abstract class Team extends MsgChat implements ITeam {
  Team(this.metadata, List<String> labels, {IBelong? space})
      : super(
          metadata.belongId,
          metadata.id,
          ShareIcon(
            name: metadata.name,
            typeName: metadata.typeName,
            avatar: FileItemShare.parseAvatar(metadata.icon),
          ),
          labels,
          metadata.remark ?? "",
          space,
        ) {
    memberTypes = [TargetType.person];
  }

  @override
  get id {
    return metadata.id;
  }

  @override
  late List<TargetType> memberTypes;

  @override
  late XTarget metadata;

  bool _memberLoaded = false;

  Future<XTarget?> create(TargetModel data) async {
    data.belongId = space.metadata.id;
    data.teamCode = data.teamCode ?? data.code;
    data.teamName = data.teamName ?? data.name;
    var res = await kernel.createTarget(data);
    if (res.success && res.data != null) {
      return res.data;
    }
    return null;
  }

  @override
  void recvTarget(String operate, bool isChild, XTarget target) {
     if(isChild && memberTypes.contains(TargetType.getType(target.typeName))){
       switch (operate) {
         case 'Add':
           members.add(target);
           loadMemberChats([target], true);
           break;
         case 'Remove':
            members.removeWhere((a) => a.id == target.id);
           loadMemberChats([target], false);
           break;
         default:
           break;
       }
     }
  }

  @override
  bool hasAuthoritys(List<String> authIds) {
    authIds = space.superAuth?.loadParentAuthIds(authIds) ?? authIds;
    var orgIds = [metadata.belongId, metadata.id];
    return space.user.authenticate(orgIds, authIds);
  }

  @override
  void loadMemberChats(List<XTarget> members, bool isAdd) {
    memberChats = [];
  }

  @override
  Future<List<XTarget>> loadMembers({bool reload = false}) async {
    if (!_memberLoaded || reload) {
      var res = await kernel.querySubTargetById(GetSubsModel(
        id: metadata.id,
        subTypeNames: memberTypes.map((e) => e.label).toList(),
        page: PageRequest(offset: 0, limit: 9999, filter: ''),
      ));
      if (res.success) {
        _memberLoaded = true;
        members = res.data?.result ?? [];
        loadMemberChats(members, true);
      }
    }
    return members;
  }

  @override
  Future<bool> pullMembers(List<XTarget> members) async {
    var filterMembers = members
        .where((i) => memberTypes.contains(TargetType.getType(i.typeName)))
        .toList();
    filterMembers = filterMembers.where((element) {
      return this.members.where((m) => m.id == element.id).isEmpty;
    }).toList();
    if (filterMembers.isNotEmpty) {
      var res = await kernel.pullAnyToTeam(GiveModel(
        id: metadata.id,
        subIds: members.map((i) => i.id).toList(),
      ));
      if (res.success) {
        this.members.addAll(filterMembers);
        loadMemberChats(members, true);
      }
      return res.success;
    }
    return true;
  }

  @override
  Future<bool> removeMembers(List<XTarget> members) async {
    bool success = false;
    for (var member in members) {
      if (memberTypes.contains(TargetType.getType(member.typeName))) {
        var res = await kernel
            .removeOrExitOfTeam(GainModel(id: metadata.id, subId: member.id));
        success = res.success;
        if (res.success) {
          this.members.removeWhere((i) => i.id == member.id);
          loadMemberChats([member], false);
        }
      }
    }
    return success;
  }

  @override
  Future<bool> update(TargetModel data) async {
    data.id = metadata.id;
    data.typeName = metadata.typeName;
    data.belongId = metadata.belongId;
    data.name = data.name ?? metadata.name;
    data.code = data.code ?? metadata.code;
    data.icon = data.icon ?? metadata.icon;
    data.teamName = data.teamName ?? data.name;
    data.teamCode = data.teamCode ?? data.code;
    data.remark = data.remark ?? metadata.remark;
    var res = await kernel.updateTarget(data);
    if (res.success && res.data?.id != null) {
      metadata = res.data!;
      share.typeName = metadata.typeName;
      share.name = metadata.name;
      share.avatar = FileItemShare.parseAvatar(metadata.icon);
    }
    return res.success;
  }
}
