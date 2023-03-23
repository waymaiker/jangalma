import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jangalma/screens/quiz_screen/components/quiz_wrapper_component.dart';

class QuizScreen extends HookWidget {
  const QuizScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: QuizWrapperComponent(),
    );
  }
}