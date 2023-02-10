import 'package:flutter/material.dart';

abstract class ColorManager {
  static const Color primary = Color(0xFFF26B1D);
  static const Color primaryOpacity = Color(0x7AF26B1D); //Opacity(0.48);

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF757575);

  static const Color lightBlue = Color(0xFF4AB0D9);
  static const Color lightBlueOpacity = Color(0x364AB0D9); //Opacity(0.21)

  static const Color softYellow = Color(0xFFD4D94A);
  static const Color softYellowOpacity = Color(0x36D4D94A); //Opacity(0.21);

  static const Color darkGrey = Color(0xFF303030);
  static const Color darkGreyOpacity = Color(0x4D303030); //Opacity(0.3);

  static const Color lightGrey = Color(0xFFA2A2A2);
  static const Color grey1 = Color(0xFFA09F9F);
  static const Color grey2 = Color.fromRGBO(156, 153, 153, 0.16);
}
