import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  AppText(
      {super.key,
        this.size = 16,
        required this.text,
        this.textAlign = TextAlign.start,
        this.fontWeight = FontWeight.normal,
        this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style:
      TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
