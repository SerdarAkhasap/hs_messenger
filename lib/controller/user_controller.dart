import 'package:flutter/services.dart';
import 'package:messenger/model/message_model.dart';
import 'package:messenger/model/user_model.dart';

class UserController {

  Future<List<UserModel>> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    final String response = await rootBundle.loadString('assets/users.json');
    return userModelFromJson(response);
  }

  Future<List<MessageModel>> getMessages() async {
    await Future.delayed(const Duration(seconds: 2));
    final String response = await rootBundle.loadString('assets/messages.json');
    return messageModelFromJson(response);
  }
}