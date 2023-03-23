import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizViewModelProvider = ChangeNotifierProvider(
  (ref) => QuizViewModel()
);

class QuizViewModel extends ChangeNotifier {
  late List<Map<String, dynamic>> questions;
  late List<String> questionsGoodFeedback;

  void initViewModel(List<Map<String, dynamic>> data, Map<String,List<String>> feedback){
    questions = data;
    questionsGoodFeedback = feedback["goodAnswer"]!;
  }

  String getFeedback(){
    questionsGoodFeedback.shuffle();
    return questionsGoodFeedback.first;
  }
}
