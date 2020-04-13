import 'package:flutter/material.dart';

const fieldTextStyle = const TextStyle(fontFamily: 'SF UI Text', fontSize: 16, color: Color.fromRGBO(50, 50, 50, 1.0));
const normalTextStyle = const TextStyle(fontFamily: 'SF UI Text', fontSize: 16, color: Color.fromRGBO(50, 50, 50, 1.0));
const errorTextStyle = const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(255, 0, 0, 1.0));
const littleTextStyle = const TextStyle(fontFamily: 'SF UI Text', fontSize: 11, color: Color.fromRGBO(50, 50, 50, 1.0));

class AppDecoration extends InputDecoration {
  const AppDecoration({
    String labelText,
    String hintText,
    bool hasFloatingPlaceholder,
    EdgeInsetsGeometry contentPadding,
    String prefixText,
  }) : super(
    contentPadding: contentPadding,
    floatingLabelBehavior: (hasFloatingPlaceholder ?? false) ? FloatingLabelBehavior.never : FloatingLabelBehavior.always,
    border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(150, 150, 150, 1.0))),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(150, 150, 150, 1.0))),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(75, 75, 75, 1.0))),
    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 1.0))),
//    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 1.0))),

    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1.0)),
    hintStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(204, 204, 204, 1.0)),
//    errorStyle: const TextStyle(fontFamily: 'SF UI Text', fontWeight: FontWeight.w500, fontSize: 12, color: Colors.redAccent),
    prefixText: prefixText,
    prefixStyle: fieldTextStyle
  );
}
