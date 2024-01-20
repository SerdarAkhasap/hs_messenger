import 'package:flutter/material.dart';
import 'package:messenger/utils/Palette.dart';
import 'package:messenger/widgets/custom_icon_button.dart';
import 'package:messenger/widgets/custom_field.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, this.onSendPressed});
  final Function(String text)? onSendPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CustomIconButton(
            onPressed: () => {},
            backgroundColor: Palette.searchBg,
            width: 50,
            height: 50,
            icon: Transform.rotate(
              angle: 70,
                child: const Icon(Icons.attach_file, size: 30,)),
          ),
          const SizedBox(width: 10,),
          Expanded(child: CustomField( hintText: 'Сообщение', onSubmitted: onSendPressed,)),
          const SizedBox(width: 10,),
          CustomIconButton(
            onPressed: () => {},
            backgroundColor: Palette.searchBg,
            width: 50,
            height: 50,
            icon: Transform.rotate(
                angle: 70,
                child: const Icon(Icons.keyboard_voice_sharp, size: 30,)),
          ),
        ],
      ),
    );
  }
}
