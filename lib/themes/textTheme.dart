import 'package:flutter/material.dart';

TextStyle textStyle({
  double fontSize,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.white
}){
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    fontFamily: 'Ubuntu',

  );
}