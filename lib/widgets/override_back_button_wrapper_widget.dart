import 'package:flutter/material.dart';

class OverrideBackButtonWrapperWidget extends StatelessWidget {
  final Widget child;

  const OverrideBackButtonWrapperWidget({
    required this.child
  });

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: child
      ),
    );
  }
}
