import 'package:flutter/material.dart';

Widget myText(
    {String txt = "",
    EdgeInsets padding = const EdgeInsets.all(0),
    double fontSize = 14,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.normal,
    TextOverflow textOverflow = TextOverflow.visible,
    TextDecoration? strikeText}) {
  return Padding(
    padding: padding,
    child: Text(
      txt,
      overflow: textOverflow,
      style: TextStyle(
          decoration: strikeText,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
      textAlign: textAlign,
    ),
  );
}
