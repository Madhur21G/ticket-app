import 'package:flutter/material.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';

class TextStyleFourth extends StatelessWidget {
  final String text;
  final TextAlign align;
  const TextStyleFourth(
      {super.key, required this.text, this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
    );
  }
}
