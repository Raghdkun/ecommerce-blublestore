import 'package:flutter/material.dart';
import 'package:powerecommerce/core/constant/color.dart';

ThemeData themeDark = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    
    displayLarge: TextStyle(
      fontFamily: "Cairo",
      
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.customBlack,
        fontWeight: FontWeight.bold,
        fontSize: 17),
    bodyMedium: TextStyle(
        height: 2,
        color: Colors.deepPurple,
        fontSize: 15,
        fontWeight: FontWeight.bold),
  ),
  scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    ),
    
    
);
ThemeData themeLight = ThemeData.dark().copyWith(
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepPurple),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.customBlack,
        fontWeight: FontWeight.bold,
        fontSize: 17),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.customBlack,
        fontSize: 15,
        fontWeight: FontWeight.bold),
  ),
  scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    ),
);

