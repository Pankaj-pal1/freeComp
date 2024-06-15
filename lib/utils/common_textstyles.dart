import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextFieldTextStyle() {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );
}

ButtonTextStyle(){
  return
  GoogleFonts.lato(
      fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);
}

TextFieldLabelStyle() {
  return GoogleFonts.lato(
      fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400);
}
appbarTabSmallTextStyle() {
  return GoogleFonts.lato(
      fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400);
}

greyTextStyleBlack16(){
  return
    GoogleFonts.lato(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);
}
greyTextStyleBGrey14(){
  return
    GoogleFonts.lato(
        fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold);
}





