import 'dart:io';

import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    required this.widgets,
  });

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isIOS
        ? MediaQuery.of(context).size.height*.8
        : MediaQuery.of(context).size.height*.74,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: widgets.length,
        itemBuilder: (context, index){
          return widgets[index];
        },
      ),
    );
  }
}