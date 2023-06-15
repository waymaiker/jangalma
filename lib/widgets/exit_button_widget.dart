import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExitButtonWidget extends StatelessWidget {
  final Function userActionsWhenExiting;

  const ExitButtonWidget({
    required this.userActionsWhenExiting
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        userActionsWhenExiting();
        GoRouter.of(context).go('/home');
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: const Icon(
          Icons.close,
          size: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}