import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger/main_naviagtor.dart';
import 'package:messenger/theme.dart';

import 'pages/chat_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor:Colors.white, statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainNavigator(),
    );
  }
}
