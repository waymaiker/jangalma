import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExitButtonWidget extends StatelessWidget {

  const ExitButtonWidget();

  @override
  Widget build(BuildContext context) {
     Color color = Platform.isIOS
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(224, 224, 224, 1);
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/home'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: color,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20)
            )
          ),
          child: const Icon(
            Icons.close,
            size: 30,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}