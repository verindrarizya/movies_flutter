import 'package:flutter/material.dart';
import 'package:pemula_submission/components/text_styles.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextStyle textStyle;

  const TextWithIcon(this.text, {
    Key? key,
    required this.icon,
    this.textStyle = descTextStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 2,),
        Text(
            text,
            style: textStyle
        )
      ],
    );
  }
}
