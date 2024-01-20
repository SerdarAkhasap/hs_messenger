import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/utils/Palette.dart';
import 'package:messenger/widgets/custom_field.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.symmetric(horizontal: 20),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          const Text('Чаты',
          style: TextStyle(
            color: Palette.boldTextColor,
            fontSize: 33,
            fontWeight: FontWeight.w600,
          ),),
          const SizedBox(height: 5,),
          CustomField(
            prefixIcon: const Icon(CupertinoIcons.search),
            hintText: 'Поиск',
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
