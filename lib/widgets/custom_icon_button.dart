import 'package:flutter/material.dart';
import 'package:messenger/utils/Palette.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.onPressed, this.width, this.height, this.backgroundColor, required this.icon});
  final Function() onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed: onPressed,
        style:  ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius:
                    BorderRadius.circular(15)
                )
            ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor ?? Colors.transparent
          )
        ),
        constraints:  BoxConstraints(
            maxWidth: width ?? 20, minWidth: width ?? 20,
            maxHeight:height ?? 20, minHeight: height ?? 20),
        padding: EdgeInsets.zero,
        icon: icon);
  }
}
