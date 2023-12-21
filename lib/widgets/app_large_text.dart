import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  double height;
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  AppLargeText(
      {super.key,
      this.size = 24,
      this.height = 1.2,
      required this.text,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color, fontSize: size, fontWeight: fontWeight, height: height),
    );
  }
}
