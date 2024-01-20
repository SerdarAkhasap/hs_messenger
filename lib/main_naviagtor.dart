import 'package:flutter/material.dart';
import 'package:messenger/controller/utils.dart';
import 'package:messenger/main.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/pages/chat_list.dart';
import 'package:messenger/pages/user_chat.dart';


class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});



  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (pop) => {
       onPop()
      },
      canPop: false,
      child: Navigator(
        key: mainNavigatorState,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          return PageRouteBuilder(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              pageBuilder: (_, __, ___) {
                switch (settings.name) {
                  case '/':
                    return const ChatList();
                  case '/chat':
                    return UserChat(
                        item: settings.arguments as UserModel
                    );
                }
                return const Placeholder();
              });
        },
      ),
    );
  }
}
