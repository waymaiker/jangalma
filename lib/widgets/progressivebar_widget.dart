import 'dart:io';

import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import 'package:jangalma/helpers/constants.dart';

class ProgressionBar extends StatelessWidget {
  final int maxSteps;
  final int currentStep;
  final bool extraThin;

  const ProgressionBar({
    required this.maxSteps,
    required this.currentStep,
    this.extraThin = false
  });

  @override
  Widget build(BuildContext context) {
    Color color = Platform.isIOS
      ? const Color.fromRGBO(245, 245, 245, 1)
      : const Color.fromRGBO(224, 224, 224, 1);

    final height = extraThin
      ? MediaQuery.of(context).size.height*0.0057
      : MediaQuery.of(context).size.height*0.015;

    return Container(
      height: height,
      width: MediaQuery.of(context).size.width*0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: color
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5)
        )
      ),
      child: LinearProgressBar(
        maxSteps: maxSteps,
        progressType: LinearProgressBar.progressTypeLinear,
        currentStep: currentStep,
        progressColor: chooseCurrentColor(currentStep),
        backgroundColor: color
      )
    );
  }

  Color chooseCurrentColor(int progress) {
    if (progress<maxSteps*0.4) {
      return const Color.fromARGB(255, 225, 41, 38);
    } else if (progress>=maxSteps*0.4 && progress<maxSteps*0.70) {
      return const Color.fromRGBO(255, 222, 89, 1);
    } else if (progress>=maxSteps*0.7 && progress<=maxSteps*0.9) {
      return FORTH_COLOR;
    }

    return Colors.green.shade500;
  }
}