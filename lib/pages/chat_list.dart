import 'package:flutter/material.dart';
import 'package:messenger/controller/user_controller.dart';
import 'package:messenger/model/message_model.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/pages/user_chat.dart';
import 'package:messenger/utils/Palette.dart';
import 'package:messenger/widgets/chat_header.dart';
import 'package:messenger/widgets/list_item.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<StatefulWidget> createState() => _StateChatList();

}

class _StateChatList extends State<ChatList> {

  UserController userController = UserController();
  List<UserModel> users = List<UserModel>.empty();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    final userList = await userController.getUsers();
    final messages = await userController.getMessages();
    if (userList.isNotEmpty && messages.isNotEmpty) {
      for (var user in userList) {
        final userMessages = messages.where((message) =>
        (message.receivedUserId == user.userId && message.senderUserId == 5) ||
            (message.senderUserId == user.userId && message.receivedUserId == 5));

        if (userMessages.isNotEmpty) {
          MessageModel lastMessage = userMessages.reduce((currMessage, nextMessage) =>
          currMessage.messageId > nextMessage.messageId ? currMessage : nextMessage);

          user.lastMessageTime = lastMessage.messageCreateDate;
          user.lastMessage = lastMessage.message;
          user.lastMessageSenderId = lastMessage.senderUserId;
        } //userMessages is not empty
      }
    }

    setState(() {
      users = userList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ChatHeader(),
              const Divider(
                color: Palette.searchBg,
              ),
              Expanded(
                  child: users.isNotEmpty
                  ? ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 4,
                    itemBuilder: (context, index) => ListItem(
                      onPressed: (user) => {
                        Navigator.pushNamed(context, '/chat', arguments: user)
                      },
                      item: users[index],
                    ),
                    separatorBuilder: (context, index ) => const Divider(color: Palette.searchBg,),
                  )
                      : const Center(
                        child: CircularProgressIndicator(
                                            color: Palette.searchTextColor,
                                          ),
                      )
              )
            ],
          ),
        ));
    ;
  }
}
