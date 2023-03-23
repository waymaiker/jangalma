import 'package:flutter/material.dart';

import 'package:jangalma/widgets/exit_button_widget.dart';

class TopBarWidget extends StatelessWidget {
  final String text;
  final bool defaultStyle;
  final Widget widget;

  const TopBarWidget({
    this.widget = const SizedBox(),
    this.text = '',
    this.defaultStyle = true
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        defaultStyle
          ? defaultStyleWidget()
          : widget,
        ExitButtonWidget(actions: () => {
          Navigator.pushNamed(context, '/home')
        })
      ],
    );
  }

  Row defaultStyleWidget() {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          )
        ),
      ],
    );
  }
}