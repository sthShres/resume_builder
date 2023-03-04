import 'package:flutter/material.dart';

class ResumeConstColor {
  static const Color resumeBackgroundColor = Color(0xfff0f0f3);
  static const Color primary = Colors.amber;
  static const Color appbarColor1 = Color(0xff6892e4);
  static const Color appbarColor2 = Color(0xfff6eefd);
  static const Color appbarColor3 = Color(0xffbdc0f9);
  static const Color appbarColor5 = Color(0xff7215d8);
  static const Color headLineColor = Colors.deepOrange;
}

class ResumeCustomTextStyle {
  static TextStyle poppins({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'poppins',
    );
  }
}

// padding

const EdgeInsets customPaddingThisproject =
    EdgeInsets.symmetric(horizontal: 10, vertical: 5);
