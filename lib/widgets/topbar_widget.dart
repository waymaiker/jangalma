import 'package:flutter/material.dart';
import 'package:jangalma/helpers/constants.dart';

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
    return Container(
      color: FORTH_COLOR,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.05),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          defaultStyle
            ? defaultStyleWidget()
            : widget,
          const ExitButtonWidget()
        ],
      ),
    );
  }

  Padding defaultStyleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        )
      ),
    );
  }
}