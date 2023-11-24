import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TextStyleName {
  static TextStyle blackTextStyle = GoogleFonts.caladea(
    color: ColorName.textColor,
  );

  static TextStyle accentTextStyle = GoogleFonts.caladea(
    color: ColorName.accentColor,
  );
}

class FontStyleName {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
