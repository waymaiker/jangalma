import 'dart:io';

import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    required this.widgets,
  });

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widgets.length,
            (BuildContext context, int index) {
              return widgets[index];
            },
          )
        )
      : SizedBox(
          height: MediaQuery.of(context).size.height*.9,
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