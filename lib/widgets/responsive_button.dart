import 'package:bento_umeezo/misc/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatefulWidget {
  bool? isResponsive;
  double? width;
  String text;

  ResponsiveButton({super.key, this.isResponsive = false, this.width, this.text = ""});

  @override
  State<ResponsiveButton> createState() => _ResponsiveButtonState();
}

class _ResponsiveButtonState extends State<ResponsiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.bottonColorBrown
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
          if (widget.text == "") ... [
            Image.asset("images/ic-button-right.png"),
          ]
        ],
      ),
    );
  }
}
