import 'package:flutter/material.dart';

class Style {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color(0xff5329cf)),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextStyle(fontSize: 20, fontFamily: "LexendDeca", color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      centerTitle: true,
    ),

  );
}