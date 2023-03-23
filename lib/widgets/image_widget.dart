import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String src;
  final int sizeIcon;

  const ImageWidget({
    required this.src,
    this.sizeIcon = -1
  });

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    
    switch (sizeIcon) {
      case 1:
        width = MediaQuery.of(context).size.width*.1;
        height = MediaQuery.of(context).size.height*.05;
        break;
      case 2:
        width = MediaQuery.of(context).size.width*.4;
        height = MediaQuery.of(context).size.height*.2;
        break;
      case 3:
        width = MediaQuery.of(context).size.width*.1;
        height = MediaQuery.of(context).size.height*.05;
        break;
      default:
        width = MediaQuery.of(context).size.width*.15;
        height = MediaQuery.of(context).size.height*.08;
    }


    return ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: Image.network(        
        src,
        fit: BoxFit.cover,
        width: width,
        height: height,
      )
    );
  }
}