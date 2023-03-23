import 'package:flutter/material.dart';
import 'package:jangalma/widgets/card_item_container_widget.dart';

class CardItemHomeScreenWidget extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final int level;
  final int numberOfQuestions;

  const CardItemHomeScreenWidget({
    required this.id,
    required this.name,
    required this.image,
    required this.level,
    required this.numberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/quiz'),
      child: CardItemContainerWidget(
        backgroundColor: id%3,
        widget: Row(
          children: [              
            SizedBox(
              width: MediaQuery.of(context).size.width*.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardContentWidget(name: name, numberOfQuestions: numberOfQuestions),
                  CardItemLevel(level: level),               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade200,
      border: Border.all(
        width: 1,
        color: Colors.grey.shade200,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10)
      ),     
    );
  }
}

class CardItemLevel extends StatelessWidget {
  final int level;

  const CardItemLevel({
    required this.level
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.13,
      height: MediaQuery.of(context).size.height*.07,
      decoration: BoxDecoration(
        color: Colors.yellowAccent.shade700,
        borderRadius: const BorderRadius.all(
          Radius.circular(20)
        )
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width*.045,
            top: MediaQuery.of(context).size.height*.015,
            child: Text(
              level.toString(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.yellow.shade900,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          CircularProgressIndicator(
            value: level.toDouble()/5,
            valueColor:  AlwaysStoppedAnimation<Color>(Colors.yellowAccent.shade400),
            backgroundColor: Colors.yellow.shade900,
            semanticsLabel: 'Circular progress indicator',
          ),
        ],
      ),
    );
  }
}

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({
    required this.name,
    required this.numberOfQuestions,
  });

  final String name;
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
          Text(
            "$numberOfQuestions questions",
            style: const TextStyle(fontSize: 16)
          ),
        ],
      ),
    );
  }
}