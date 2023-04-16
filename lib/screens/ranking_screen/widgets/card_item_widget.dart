import 'package:flutter/material.dart';

import 'package:jangalma/widgets/image_widget.dart';

class CardItemWidget extends StatelessWidget {
  final String userImage;
  final String userPseudo;
  final String userPoints;
  final String userRank;
  final bool isMinimal;

  const CardItemWidget({
    required this.userImage,
    required this.userPseudo,
    required this.userPoints,
    required this.userRank,
    this.isMinimal = false
  });

  @override
  Widget build(BuildContext context) {
    return isMinimal
      ? minimalCard(context)
      : fullCard(context);
  }

  Stack minimalCard(BuildContext context){
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageWidget(src: userImage),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    userPseudo,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$userPoints points",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 0,
          top: 40,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CardItemId(id: userRank),
            )
          )
        ),
      ],
    );
  }

  Container fullCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.1,
      width: MediaQuery.of(context).size.width*.9,
      padding: const EdgeInsets.all(10),
      decoration: boxDecoration(),
      child: Row(
        children: [
          ImageWidget(src: userImage),
          SizedBox(
            width: MediaQuery.of(context).size.width*.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardContentWidget(userPseudo: userPseudo, userPoints: userPoints),
                CardItemId(id: userRank)
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade200,
      border: Border.all(
        width: 1,
        color: Colors.grey.shade400,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(25)
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.shade600,
          blurRadius: 3,
          offset: const Offset(0.0, 4),
        ),
      ],
    );
  }
}

class CardItemId extends StatelessWidget {
  final String id;

  const CardItemId({
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      id,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({
    required this.userPseudo,
    required this.userPoints,
  });

  final String userPseudo;
  final String userPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userPseudo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
          Text(
            "$userPoints points",
            style: const TextStyle(fontSize: 16)
          ),
        ],
      ),
    );
  }
}