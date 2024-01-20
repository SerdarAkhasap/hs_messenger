import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:messenger/controller/user_controller.dart';
import 'package:messenger/model/message_model.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/utils/Palette.dart';
import 'package:messenger/widgets/message_box.dart';
import 'package:messenger/widgets/user_header.dart';

class UserChat extends StatefulWidget {
  const UserChat({super.key, required this.item});

  final UserModel item;

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  UserController userController = UserController();
  List<MessageModel> messages = List<MessageModel>.empty( growable: true);

  @override
  void initState() {
    super.initState();
    getUserMessages();
  }

  void _onSendPressed(String text) {
    int messageId = messages.reduce((cur, next) => cur.messageId > next.messageId ? cur : next).messageId;
    setState(() {
      messages.add(MessageModel(
          messageId: messageId + 1,
          receivedUserId: widget.item.userId,
          senderUserId: 5,
          message: text,
          isRead: false,
          messageCreateDate: DateTime.now().toString()));
    });
  }

  Future<void> getUserMessages() async {
    final ms = await userController.getMessages();
    final userMessages = ms.where((message) =>
        (message.receivedUserId == widget.item.userId &&
            message.senderUserId == 5) ||
        (message.senderUserId == widget.item.userId &&
            message.receivedUserId == 5));
    if (userMessages.isNotEmpty) {
      setState(() {
        messages = userMessages.toList();
      });
    }
  }

  String _getParsedHours(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${_isTwo(dateTime.hour)}:${_isTwo(dateTime.minute)}';
  }

  String _isTwo(int number) {
    return number > 9 ? number.toString() : '0$number';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserHeader(
              item: widget.item,
            ),
            const Divider(
              color: Palette.searchBg,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const AlwaysScrollableScrollPhysics(),
                reverse: true,
                child: messages.isNotEmpty
                    ? Column(children: [
                        for (int i = 0; i < messages.length; i++)
                          ChatBubble(
                            clipper: ChatBubbleClipper6(
                                type: messages[i].receivedUserId == 5
                                    ? BubbleType.receiverBubble
                                    : BubbleType.sendBubble
                            ),
                            alignment: messages[i].senderUserId == 5
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                            backGroundColor: messages[i].receivedUserId == 5
                            ? Palette.searchBg
                            : Palette.senderBgColor,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(messages[i].message, style: const TextStyle(
                                    fontSize: 15
                                ),),
                                const SizedBox(width: 15,),
                                Transform.translate(
                                  offset: const Offset(0.0, 5),
                                    child:  Text(_getParsedHours(messages[i].messageCreateDate),
                                    style: const TextStyle(fontSize: 14, color: Palette.searchTextColor),)),
                                const SizedBox(width: 5,),
                                Transform.translate(
                                    offset: const Offset(0.0, 5),
                                    child:  const Icon(Icons.check, size: 15, color: Palette.searchTextColor,)),
                                if (messages[i].isRead)
                                Transform.translate(
                                    offset: const Offset(-5, 5),
                                    child:  const Icon(Icons.check, size: 15, color: Palette.searchTextColor,)),
                              ],
                            )
                          )
                      ])
                    : const Center(
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: Palette.searchTextColor,
                          ),
                        ),
                      ),
              ),
            ),
            const Divider(
              color: Palette.searchBg,
            ),
             MessageBox(
              onSendPressed: _onSendPressed,
            )
          ],
        ),
      ),
    );
  }
}
