///
/// This file contains Theme styles for quick usage in application
///
/// Author: Muhammad Rehan
/// email: mrmuhammadrehan65@gmail.com
///
/// This code is subjected to an assment, you might want to
/// copy this code and modify as your own need, you are free to
/// use this code as your own.
///

import 'package:claimazon/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyles {
  //Title style
  static final kBigTitleStyle = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  //Title style
  static final kTitleStyle = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  //White Title style
  static final kTitleStyleWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  //Error Title style
  static final kTitleStyleError = GoogleFonts.roboto(
    color: ThemeColor.smoothDangerColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  //Text style
  static final kLabelStyle = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontSize: 16,
  );
  //Text style
  static final kSimpleLabelStyle = GoogleFonts.roboto(
    color: Colors.grey[800],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  //Text style
  static final kMiniLabelStyle = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontSize: 14,
  );

  //Text style
  static final kLabelStyleWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  //Label Hint style
  static final kHintTextStyle = GoogleFonts.roboto(
    color: Colors.white54,
    fontSize: 16,
  );

  //Label Hint style With White BG
  static final kHintTextStyleWhiteBg = GoogleFonts.roboto(
    color: Colors.grey[600],
    fontSize: 16,
  );
  //Label Hint style With White BG
  static final kBoldHintTextStyleWhiteBg = GoogleFonts.roboto(
    color: Colors.grey[600],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  //Label Hint dANGER
  static final kHintTextDangerStyle = GoogleFonts.roboto(
    color: ThemeColor.smoothDangerColor,
    fontSize: 16,
  );

  //Label Hint style
  static final kHintTextStyleWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16,
  );

  //Label Hint style
  static final kMiniHintWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14,
  );
  static final kMiniHint = GoogleFonts.roboto(
    color: Colors.grey[600],
    fontSize: 14,
  );

  //Bold Label
  static final kLabelBold = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  //Bold Label
  static final kLabelBoldWhite = GoogleFonts.roboto(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  //Box Background Color with gredient
  static final kBoxDecorationStyle = BoxDecoration(
    color: ThemeColor.primeryColorDim,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(22),
      topRight: Radius.circular(22),
    ),
  );
  //Box Background Color with gredient
  static final kBoxDecorationStyleWhite = BoxDecoration(
    color: const Color(0xFF74b9ff),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}
