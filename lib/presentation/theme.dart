import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm/presentation/utils/constants/colors.dart';


class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(backgroundColor: primaryClr),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: darkGreyClr),
  );

}
