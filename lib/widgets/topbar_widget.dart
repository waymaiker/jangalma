import 'package:flutter/material.dart';

import 'package:jangalma/widgets/exit_button_widget.dart';

class TopBarWidget extends StatelessWidget {
  String text;
  bool defaultStyle;
  Widget widget;

  TopBarWidget({
    this.widget = const SizedBox(),
    this.text = '',
    this.defaultStyle = true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
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
      ),
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