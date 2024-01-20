import 'package:flutter/material.dart';
import 'package:messenger/controller/utils.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/utils/Palette.dart';
import 'package:messenger/widgets/custom_icon_button.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key, required this.item});

  final UserModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          const CustomIconButton(onPressed: onPop,
          icon: Icon(Icons.arrow_back_ios),
          width: 20,
          height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 30,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [item.colors![0], item.colors![1]])),
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
                const Text(
                  'В сети',
                  style: TextStyle(
                      color: Palette.searchTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
