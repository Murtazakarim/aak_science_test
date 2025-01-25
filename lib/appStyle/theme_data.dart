import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KAppStyle {
  static final KAppStyle _instance = KAppStyle._init();
  static KAppStyle get instance => _instance;

  KAppStyle._init();
/// colors of the app
  static const String fontFamily = 'Poppins';
  static const Color backgroundColor = Colors.white;
  static const Color primaryColor = Colors.greenAccent;
  static const Color secondaryColor = Colors.green;
  static const Color blackColor = Colors.black;



  /// text style
  static final TextStyle ksize14text = GoogleFonts.poppins(fontSize: 14,color: blackColor,fontWeight: FontWeight.w500);
}