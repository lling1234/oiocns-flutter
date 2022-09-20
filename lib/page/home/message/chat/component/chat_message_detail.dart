import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:orginone/api_resp/message_detail_resp.dart';
import 'package:orginone/api_resp/org_chat_cache.dart';
import 'package:orginone/component/text_avatar.dart';
import 'package:orginone/page/home/message/chat/chat_controller.dart';
import 'package:orginone/page/home/message/chat/component/chat_func.dart';
import 'package:orginone/page/home/message/chat/component/text_message.dart';
import 'package:orginone/util/hive_util.dart';

import '../../../../../api_resp/target_resp.dart';
import '../../../../../component/popup_router.dart';
import '../../../../../component/unified_edge_insets.dart';
import '../../../../../component/unified_text_style.dart';
import '../../../../../enumeration/enum_map.dart';
import '../../../../../enumeration/message_type.dart';

enum Direction { leftStart, rightStart }

class ChatMessageDetail extends GetView<ChatController> {
  final Logger log = Logger("ChatMessageDetail");

  final String sessionId;
  final MessageDetailResp messageDetail;
  final bool isMy;
  final bool isMultiple;

  ChatMessageDetail(this.sessionId, this.messageDetail, this.isMy,
      this.isMultiple,
      {Key? key})
      : super(key: key);

  String targetName() {
    OrgChatCache orgChatCache = controller.messageController.orgChatCache;
    return orgChatCache.nameMap[sessionId] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return _messageDetail(context);
  }

  Widget _messageDetail(BuildContext context) {
    List<Widget> children = [];

    bool isRecall = false;
    if (messageDetail.msgType == "recall") {
      isRecall = true;
      String msgBody = "${targetName()}：撤回了一条信息";
      children.add(Text(msgBody, style: text12Grey));
    } else {
      children.add(_getAvatar());
      children.add(_getChat(context));
    }

    return Container(
      margin: topSmall,
      child: Row(
        textDirection: isMy ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment:
        isRecall ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _getAvatar() {
    return TextAvatar(
      avatarName: targetName(),
      type: TextAvatarType.chat,
      textStyle: text12White,
    );
  }

  Widget _getChat(BuildContext context) {
    List<Widget> content = <Widget>[];

    if (isMultiple && !isMy) {
      content.add(Text(targetName()));
    }

    // 添加长按手势
    var chat = GestureDetector(
      onLongPress: () {
        if (!isMy) return;
        Navigator.push(
            context,
            NNPopupRoute(
                onClick: () {
                  Navigator.of(context).pop();
                },
                child: ChatFunc(messageDetail)));
      },
      child: _getMessage(),
    );
    content.add(chat);

    return Container(
      margin: isMy
          ? const EdgeInsets.fromLTRB(0, 0, 5, 0)
          : const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }

  Widget _getMessage() {
    MessageType messageType =
        EnumMap.messageTypeMap[messageDetail.msgType] ?? MessageType.unknown;

    TargetResp userInfo = HiveUtil().getValue(Keys.userInfo);
    switch (messageType) {
      case MessageType.text:
      case MessageType.unknown:
        return TextMessage(
            messageDetail.msgBody,
            messageDetail.fromId == userInfo.id
                ? TextDirection.rtl
                : TextDirection.ltr);
    }
  }
}
