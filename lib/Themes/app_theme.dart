import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
  ),
  iconTheme: const IconThemeData(color: MyColors.purple),
  scaffoldBackgroundColor: MyColors.light,
);

ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      // ignore: deprecated_member_use
      headline1: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: MyColors.purple),
    scaffoldBackgroundColor: MyColors.darkTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed, elevation: 20.0));
