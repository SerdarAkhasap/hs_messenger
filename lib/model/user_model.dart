
import 'dart:convert';

import 'package:flutter/material.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel {

  UserModel({
    required this.userId,
    required this.name,
    required this.surname,
    this.lastMessage,
    this.lastMessageSenderId,
    this.lastMessageTime,
    this.colors
});

  final int userId;
  final String name;
  final String surname;
  String? lastMessage;
  int? lastMessageSenderId;
  String? lastMessageTime;
  List<MaterialColor>? colors;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['user_id'],
    name: json["name"],
    surname: json["surname"],
  );
}