import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


appbarTextStyle() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}

TextFieldTextStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );
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





