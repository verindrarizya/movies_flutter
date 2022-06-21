import 'package:flutter/material.dart';

class TextWithBox extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color fontColor;
  final EdgeInsetsGeometry padding;
  final String? fontFamily;

   const TextWithBox(this.text, {
    Key? key,
    this.fontSize = 12,
    required this.color,
     this.fontColor = Colors.white,
     this.padding = const EdgeInsets.symmetric(
         vertical: 1,
         horizontal: 2
     ),
     this.fontFamily
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(2.0))
      ),
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
          fontFamily: fontFamily
        )
      ),
    );
  }
}
