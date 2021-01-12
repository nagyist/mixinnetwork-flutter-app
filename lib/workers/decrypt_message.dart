import 'dart:convert';

import 'package:flutter_app/blaze/blaze_message.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/db/database.dart';
import 'package:flutter_app/db/mixin_database.dart';
import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:uuid/uuid.dart';
import 'injector.dart';

class DecryptMessage extends Injector {
  DecryptMessage(String selfId, Database database, Client client)
      : super(selfId, database, client);

  void process(FloodMessage floodMessage) {
    final data = jsonDecode(floodMessage.data);
    if (data['conversation_id'] != null) {
      syncConversion(data['conversation_id']);
    }
    final category = data['category'];
    if (category.startsWith('SIGNAL_')) {
      // processSignalMessage(data);
      // todo decrypt
      processDecryptSuccess(data, 'Signal Message');
    } else if (category.startsWith('PLAIN_')) {
      final base64Str = utf8.decode(base64.decode(data['data']));
      processDecryptSuccess(data, base64Str);
    } else if (category.startsWith('SYSTEM_')) {
      processSystemMessage(data);
    } else if (category == 'APP_BUTTON_GROUP' || category == 'APP_CARD') {
      processApp(data);
    } else if (category == 'MESSAGE_RECALL') {
      processRecallMessage(data);
    }
    _updateRemoteMessageStatus(floodMessage.messageId, MessageStatus.delivered);
    database.floodMessagesDao.deleteFloodMessage(floodMessage);
  }

  void processSignalMessage(data) {}

  void processPlainMessage(data) {}

  void processSystemMessage(data) {}

  void processApp(data) {}

  void processRecallMessage(data) {}

  void processDecryptSuccess(
      Map<String, dynamic> data, String plainText) async {
    // todo
    // ignore: unused_local_variable
    final user = await syncUser(data['user_id']);

    // todo process quote message

    if (data['category'] == 'PLAIN_TEXT') {}
    final message = Message(
        // todo
        messageId: data['message_id'],
        conversationId: data['conversation_id'],
        userId: data['user_id'],
        category: data['category'],
        content: plainText, // todo
        status: data['status'],
        createdAt: data['created_at']);

    await database.messagesDao.insert(message);

    _updateRemoteMessageStatus(data['message_id'], MessageStatus.delivered);
  }

  void _updateRemoteMessageStatus(messageId, status) {
    if (status != MessageStatus.delivered && status != MessageStatus.read) {
      return;
    }
    final blazeMessage = BlazeMessage(messageId, status: status);
    // ignore: avoid_print
    database.jobsDao.insert(Job(
        jobId: Uuid().v4(),
        action: acknowledgeMessageReceipts,
        priority: 5,
        blazeMessage: jsonEncode(blazeMessage),
        createdAt: DateTime.now().toIso8601String(),
        runCount: 0));
  }
}
