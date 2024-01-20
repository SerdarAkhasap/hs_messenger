import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  fontFamily: GoogleFonts.rubik().fontFamily,
  textTheme: GoogleFonts.rubikTextTheme(),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.grey,
    selectionHandleColor: Colors.grey,),
);