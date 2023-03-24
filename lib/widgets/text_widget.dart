import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String type;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextWidget({
    required this.text,
    this.type = 'default',
    this.color = const Color.fromRGBO(117, 117, 117, 1),
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (type) {
      case 'headlineLarge':
        textStyle = Theme.of(context).primaryTextTheme.headline1!.copyWith(
          color: color
        );
        break;
      case 'headlineMedium':
        textStyle = Theme.of(context).primaryTextTheme.headline2!.copyWith(
          color: color
        );
        break;
      default:
        textStyle = Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color
        );
        break;
    }
    return Text(
      text,
      style: textStyle
    );
  }
}