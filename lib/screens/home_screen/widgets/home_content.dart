import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    required this.widgets,
  });

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*.74,
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (context, index){
              return widgets[index];
            },
          ),
        )
      ],
    );
  }
}