import 'package:flutter/material.dart';

class RankingContentWidget extends StatelessWidget {
  const RankingContentWidget({
    required this.minimalCards,
    required this.widgets,
  });

  final List<Widget> minimalCards;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [...minimalCards],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.73,
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (context, index){
              return widgets[index];
            } ,
          ),
        )
      ],
    );
  }
}