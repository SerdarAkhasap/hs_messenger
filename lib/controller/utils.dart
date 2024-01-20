import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> mainNavigatorState =
GlobalKey<NavigatorState>();

void onPop () {
  bool? canPop = mainNavigatorState.currentState?.canPop();
  if (canPop != null && canPop) {
    Navigator.of(mainNavigatorState.currentState!.context).pop();
  } else {
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }
}