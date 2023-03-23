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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.close,
          size: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}