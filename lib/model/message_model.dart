import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(
    json.decode(str).map((x) => MessageModel.fromJson(x)));

class MessageModel {
  MessageModel(
      {required this.messageId,
      required this.receivedUserId,
      required this.senderUserId,
      required this.message,
      required this.isRead,
      required this.messageCreateDate});

  final int messageId;
  final int receivedUserId;
  final int senderUserId;
  final String message;
  final bool isRead;
  final String messageCreateDate;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      messageId: json['message_id'],
      receivedUserId: json['received_user_id'],
      senderUserId: json['sender_user_id'],
      message: json['message'],
      isRead: json['is_read'],
      messageCreateDate: json['message_create_date']);
}
