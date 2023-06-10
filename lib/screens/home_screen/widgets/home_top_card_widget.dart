import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jangalma/widgets/image_widget.dart';

class HomeTopCard extends StatelessWidget {
  const HomeTopCard();

  @override
  Widget build(BuildContext context) {
    const String image = "https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907_1280.jpg";
    return Platform.isIOS
      ? SizedBox(
          height: MediaQuery.of(context).size.height*.2,
          child: topCardContent(context, image),
        )
      : topCardContent(context, image);
  }

  Padding topCardContent(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "WELCOME",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
          ),
          GestureDetector(
            onTap: () => GoRouter.of(context).go('/profile'),
            child: ImageWidget(src: image, sizeIcon: 1)
          )
        ],
      ),
    );
  }
}