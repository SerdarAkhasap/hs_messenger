import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/utils/Palette.dart';

class CustomField extends StatelessWidget {
  CustomField({super.key,this.prefixIcon, this.hintText, this.onSubmitted});
  final Widget? prefixIcon;
  final String? hintText;
  final Function(String text)? onSubmitted;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      onSubmitted: (text) => {
        controller.clear(),
        if (onSubmitted != null)
          onSubmitted!(text)
      },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(
          fillColor: Palette.searchBg,
          filled: true,
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Palette.searchTextColor,
            fontSize: 17
          ),
          isDense: false,
          prefixIcon: prefixIcon,
          prefixIconColor: Palette.searchTextColor,
          isCollapsed: false,
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        )
    );
  }
}
