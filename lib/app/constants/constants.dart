import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.bold,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.w800,
  ),
  headline3: GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  ),
  headline4: GoogleFonts.poppins(
    fontSize: 10,
    color: Colors.black87,
    fontWeight: FontWeight.w400,
  ),
  headline5: GoogleFonts.poppins(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  ),
);

class AppColors {
  static Color lightBlue = const Color(0xffCFEDEF);
  static Color black = Colors.black87;
}

List<Color> boxColors = const [
  Color(0xffCEEDEF),
  Color(0xffBFBFBF),
  Color(0xffEBECF1),
  Color(0xffFDF7DD),
  Color(0xffF9CFE3),
  Color(0xffFBEBC7),
  Color(0xffE9E8E6)
];
