import 'package:flutter/material.dart';

Text customTextWidget({
  required String text,
  Color color = Colors.black,
  double fontSize = 20,
  double letterSpacing = 0.25,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign textAlign = TextAlign.start,
  TextOverflow overflow = TextOverflow.visible,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    softWrap: true,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      overflow: overflow,
    ),
  );
}
