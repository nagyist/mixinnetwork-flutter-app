// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static m0(name, addedName) => "${name}添加了${addedName}";

  static m1(name, groupName) => "${name}创建了群组${groupName}";

  static m2(name) => "${name}离开了群组";

  static m3(name) => "${name}通过邀请链接加入群组";

  static m4(name, removedName) => "${name}移除了${removedName}";

  static m5(name) => "等待${name}上线后建立加密会话。";

  static m6(name) => "确定删除${name}圈子吗？";

  static m7(date) => "${date}加入";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("关于"),
    "aboutEncryptedInfo" : MessageLookupByLibrary.simpleMessage("此对话中的消息使用端对端加密。点击了解更多。"),
    "addContact" : MessageLookupByLibrary.simpleMessage("添加联系人"),
    "appearance" : MessageLookupByLibrary.simpleMessage("显示偏好"),
    "audio" : MessageLookupByLibrary.simpleMessage("语音"),
    "block" : MessageLookupByLibrary.simpleMessage("屏蔽"),
    "botInteractHi" : MessageLookupByLibrary.simpleMessage("打招呼"),
    "botInteractInfo" : MessageLookupByLibrary.simpleMessage("点击下列按钮与机器人互动"),
    "botInteractOpen" : MessageLookupByLibrary.simpleMessage("打开主页"),
    "bots" : MessageLookupByLibrary.simpleMessage("机器人"),
    "cancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "chatBackup" : MessageLookupByLibrary.simpleMessage("聊天记录备份"),
    "chatGroupAdd" : m0,
    "chatGroupCreate" : m1,
    "chatGroupExit" : m2,
    "chatGroupJoin" : m3,
    "chatGroupRemove" : m4,
    "chatGroupRole" : MessageLookupByLibrary.simpleMessage("你现在成为管理员"),
    "chatLearn" : MessageLookupByLibrary.simpleMessage("了解更多"),
    "chatNotFound" : MessageLookupByLibrary.simpleMessage("找不到该消息"),
    "chatNotSupport" : MessageLookupByLibrary.simpleMessage("不支持此类型消息。请升级 Mixin 查看。"),
    "chatRecallDelete" : MessageLookupByLibrary.simpleMessage("此消息已撤回"),
    "chatRecallMe" : MessageLookupByLibrary.simpleMessage("你撤回了一条消息"),
    "chatWaiting" : m5,
    "chatWaitingDesktop" : MessageLookupByLibrary.simpleMessage("桌面端"),
    "circle" : MessageLookupByLibrary.simpleMessage("圈子"),
    "contact" : MessageLookupByLibrary.simpleMessage("联系人"),
    "contacts" : MessageLookupByLibrary.simpleMessage("联系人"),
    "copy" : MessageLookupByLibrary.simpleMessage("复制"),
    "dataAndStorageUsage" : MessageLookupByLibrary.simpleMessage("数据和存储使用情况"),
    "delete" : MessageLookupByLibrary.simpleMessage("删除"),
    "deleteChat" : MessageLookupByLibrary.simpleMessage("删除对话"),
    "deleteCircle" : MessageLookupByLibrary.simpleMessage("删除圈子"),
    "deleteForEveryone" : MessageLookupByLibrary.simpleMessage("撤回"),
    "deleteForMe" : MessageLookupByLibrary.simpleMessage("删除"),
    "editCircleName" : MessageLookupByLibrary.simpleMessage("编辑圈子名称"),
    "editConversations" : MessageLookupByLibrary.simpleMessage("编辑会话"),
    "editProfile" : MessageLookupByLibrary.simpleMessage("编辑资料"),
    "extensions" : MessageLookupByLibrary.simpleMessage("机器人"),
    "file" : MessageLookupByLibrary.simpleMessage("文件"),
    "forward" : MessageLookupByLibrary.simpleMessage("转发"),
    "group" : MessageLookupByLibrary.simpleMessage("群组"),
    "image" : MessageLookupByLibrary.simpleMessage("照片"),
    "initializing" : MessageLookupByLibrary.simpleMessage("初始化"),
    "introduction" : MessageLookupByLibrary.simpleMessage("介绍"),
    "live" : MessageLookupByLibrary.simpleMessage("Live"),
    "location" : MessageLookupByLibrary.simpleMessage("位置"),
    "mute" : MessageLookupByLibrary.simpleMessage("静音"),
    "name" : MessageLookupByLibrary.simpleMessage("名字"),
    "noData" : MessageLookupByLibrary.simpleMessage("没有数据"),
    "notification" : MessageLookupByLibrary.simpleMessage("通知"),
    "pageDeleteCircle" : m6,
    "pageEditProfileJoin" : m7,
    "pageLandingClickToReload" : MessageLookupByLibrary.simpleMessage("点击重新加载 QrCode"),
    "pageLandingLoginMessage" : MessageLookupByLibrary.simpleMessage("打开手机上的 Mixin Messenger，扫描屏幕上的 QrCode，确认登录。"),
    "pageLandingLoginTitle" : MessageLookupByLibrary.simpleMessage("通过 QrCode 登录 Mixin Messenger"),
    "pageRightEmptyMessage" : MessageLookupByLibrary.simpleMessage("选择一个对话，开始发送信息"),
    "phoneNumber" : MessageLookupByLibrary.simpleMessage("手机号"),
    "pin" : MessageLookupByLibrary.simpleMessage("置顶"),
    "pleaseWait" : MessageLookupByLibrary.simpleMessage("请稍等一下"),
    "post" : MessageLookupByLibrary.simpleMessage("文章"),
    "preview" : MessageLookupByLibrary.simpleMessage("预览"),
    "provisioning" : MessageLookupByLibrary.simpleMessage("处理中"),
    "recentConversations" : MessageLookupByLibrary.simpleMessage("最近聊天"),
    "reply" : MessageLookupByLibrary.simpleMessage("回复"),
    "save" : MessageLookupByLibrary.simpleMessage("保存"),
    "search" : MessageLookupByLibrary.simpleMessage("搜索"),
    "signOut" : MessageLookupByLibrary.simpleMessage("登出"),
    "sticker" : MessageLookupByLibrary.simpleMessage("贴纸"),
    "strangerFromMessage" : MessageLookupByLibrary.simpleMessage("他/她不是你的联系人"),
    "strangers" : MessageLookupByLibrary.simpleMessage("陌生人"),
    "transfer" : MessageLookupByLibrary.simpleMessage("转账"),
    "unMute" : MessageLookupByLibrary.simpleMessage("取消静音"),
    "unPin" : MessageLookupByLibrary.simpleMessage("取消置顶"),
    "video" : MessageLookupByLibrary.simpleMessage("视频"),
    "videoCall" : MessageLookupByLibrary.simpleMessage("语音电话"),
    "waitingForThisMessage" : MessageLookupByLibrary.simpleMessage("正在等待这个消息。"),
    "you" : MessageLookupByLibrary.simpleMessage("您")
  };
}
