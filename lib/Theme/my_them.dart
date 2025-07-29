import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color red = Color(0xffC91C22);
  static Color primary = Color(0xff39A552);
  static Color darkblue = Color(0xff003E90);
  static Color bink = Color(0xffED1E79);
  static Color orange = Color(0xffCF7E48);
  static Color blue = Color(0xff4882CF);
  static Color yellow = Color(0xffF2D352);
  static Color white = Color(0xffFFFFFF);
  static Color black = Color(0xff000000);
  static Color gray = Color(0xff79828B);

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
 appBarTheme: AppBarTheme(

    elevation: 0,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(20),
         bottomRight: Radius.circular(20),
       ),
     ),
     centerTitle: true,
 backgroundColor: MyTheme.primary
 ),

    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 16,
        color: MyTheme.black,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: MyTheme.black),
      titleMedium: TextStyle(
        fontSize: 20,
        color: MyTheme.white,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: MyTheme.gray,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
