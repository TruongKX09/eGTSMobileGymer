import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color themeCol = Color(0xffcbb682);

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}

TextStyle get namePKStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blueGrey));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400));
}

TextStyle get discountStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.bold, color: Colors.green));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400));
}

TextStyle get nameExStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400));
}

TextStyle get totalStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.green));
}

TextStyle get appBarStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
}
