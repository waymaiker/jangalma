import 'package:flutter/material.dart';

class ExitButtonWidget extends StatelessWidget {
  final Function actions;

  const ExitButtonWidget({
    required this.actions
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        actions()
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
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