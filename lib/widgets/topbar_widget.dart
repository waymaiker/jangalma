import 'package:flutter/material.dart';

import 'package:jangalma/helpers/constants.dart';
import 'package:jangalma/widgets/exit_button_widget.dart';

class TopBarWidget extends StatelessWidget {
  final String text;
  final bool defaultStyle;
  final Widget widget;
  final Function whenClickExitButton;

  const TopBarWidget({
    required this.whenClickExitButton,
    this.widget = const SizedBox(),
    this.text = '',
    this.defaultStyle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.01),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExitButtonWidget(userActionsWhenExiting: () => whenClickExitButton()),
          defaultStyle
            ? defaultStyleWidget()
            : widget,
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