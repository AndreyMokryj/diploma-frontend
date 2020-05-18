import 'package:SUNMAX/helpers/constants.dart';
import 'package:flutter/material.dart';

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
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: buttonColor)),
    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: buttonColor)),

    labelText: labelText,
    hintText: hintText,
    labelStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1.0)),
    hintStyle: const TextStyle(fontFamily: 'SF UI Text', fontSize: 14, color: Color.fromRGBO(204, 204, 204, 1.0)),
    prefixText: prefixText,
    prefixStyle: normalTextStyle
  );
}
