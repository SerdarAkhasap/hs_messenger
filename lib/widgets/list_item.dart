import 'package:flutter/material.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/utils/Palette.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.item, required this.onPressed});

  UserModel item;
  final Function(UserModel userModel) onPressed;
  final List<List<MaterialColor>> colors = [
    [Colors.green, Colors.lightGreen],
    [ Colors.red, Colors.deepOrange],
    [Colors.indigo, Colors.blue],
    [ Colors.red, Colors.deepOrange],
  ];

  String _parsedDate(DateTime time) {
    DateTime now = DateTime.now();
    if ((now.day - time.day) == 1) return 'Вчера';
    if (((now.hour - time.hour) < 5) && ((now.hour - time.hour) > 0 ) ) return '${time.hour} часов назад';
    if (((now.hour - time.hour) < 5) && ((now.hour - time.hour) > 0 ) ) return '${time.hour} минут назад';
    return '${_isTwo(time.day)}.${_isTwo(time.month)}.${time.year}';
  }

  String _isTwo(int number) {
    return number > 9 ? number.toString() : '0$number';
  }

  @override
  Widget build(BuildContext context) {
    item.colors = <MaterialColor>[
      colors[item.userId - 1][0],
      colors[item.userId - 1][1]
    ];
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: GestureDetector(
        onTap: () => {
          onPressed(item)
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      item.colors![0],
                      item.colors![1]
                    ])),
                child: Text(
                  '${item.name[0].toUpperCase()}${item.surname[0].toUpperCase()}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${item.name} ${item.surname}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      if (item.lastMessageSenderId != null && item.lastMessageSenderId == 5)
                        const Text("Вы:", style: TextStyle(fontSize: 15),),
                      if (item.lastMessageSenderId != null && item.lastMessageSenderId == 5)
                        const SizedBox(width: 5,),
                      Text(item.lastMessage ?? '', style: const TextStyle(color: Palette.searchTextColor,
                          fontSize: 15, fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                item.lastMessageTime != null
                    ? _parsedDate(DateTime.parse(item!.lastMessageTime as String))
                    : 'Сейчас',
                style: const TextStyle(
                    color: Palette.searchTextColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
