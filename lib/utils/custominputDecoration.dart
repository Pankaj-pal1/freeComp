import 'package:flutter/material.dart';

import 'common_textstyles.dart';

getTextFieldDecorationStyle(String prefixText, String label, String hint) {
  return InputDecoration(
      border: InputBorder.none,
      labelText: label,
      labelStyle:  TextFieldLabelStyle(),
      counterText: "",
      prefixText: prefixText,
      prefixStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 14,
          color: Colors.white
      ),
      suffixStyle:  TextStyle(
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        color: Colors.white
      ));
}