import 'dart:io';

import 'package:flutter/material.dart';

class CardItemContainerWidget extends StatelessWidget {
  final Widget widget;
  final int borderColor;
  final int backgroundColor;
  final bool isSmall;

  const CardItemContainerWidget({
    required this.widget,
    this.borderColor = -1,
    this.backgroundColor = -1,
    this.isSmall = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: isSmall
        ? MediaQuery.of(context).size.height*.08
        : Platform.isIOS
          ? MediaQuery.of(context).size.height*.1
          : MediaQuery.of(context).size.height*.15,
      decoration: boxDecoration(),
      child: widget
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: setBackgroundColor(backgroundColor),
      border: Border.all(
        width: 1,
        color: setBorderColor(borderColor),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10)
      ),
    );
  }

  Color setBackgroundColor(int index){
    switch (index) {
      case 0:
        return Colors.green.shade100;
      case 1:
        return Colors.blue.shade100;
      case 2:
        return Colors.pink.shade100;
      case 3:
        return Colors.white;
      default:
        return Colors.grey.shade200;
    }
  }

  Color setBorderColor(int index){
    switch (index) {
      case 0:
        return Colors.green.shade100;
      case 1:
        return Colors.blue.shade100;
      case 2:
        return Colors.pink.shade100;
      case 3:
        return Colors.white;
      default:
        return Colors.grey.shade200;
    }
  }
}