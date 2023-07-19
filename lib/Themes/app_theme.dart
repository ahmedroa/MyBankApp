import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/my_colors.dart';

ThemeData lightTheme = ThemeData(
  // textTheme: TextTheme(),
  iconTheme: const IconThemeData(color: MyColors.purple),
  scaffoldBackgroundColor: MyColors.light,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: MyColors.blue),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.blue,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: MyColors.blue,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
);

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.darkTheme,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        // backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff6a737b),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: MyColors.blue,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(type: BottomNavigationBarType.fixed, elevation: 20.0));
