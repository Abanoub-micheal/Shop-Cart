import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{

  static Color primaryColor =const Color(0xffF36E21);
  static Color secondaryColor =const Color(0xff042E44);
  static Color whiteColor =const Color(0xffFFFFFF);


  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    scaffoldBackgroundColor: whiteColor

  );



}