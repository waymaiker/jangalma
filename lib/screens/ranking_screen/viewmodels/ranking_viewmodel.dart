import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rankingViewModelProvider = ChangeNotifierProvider(
  (ref) => RankingViewModel()
);

class RankingViewModel extends ChangeNotifier {
  late List<Map<String,String>> contentList;
  late List<Map<String,String>> minimalList;

  RankingViewModel();

  void init(Map<String, List<Map<String,String>>> data){
    contentList = data["contentList"]!;
    minimalList = data["minimalList"]!;
  }
}