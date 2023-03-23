import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeViewModel()
);

class HomeViewModel extends ChangeNotifier {
  late List<Map<String,dynamic>> contentList;

  HomeViewModel();

  void init(List<Map<String,dynamic>> data){
    contentList = data;
  }
}