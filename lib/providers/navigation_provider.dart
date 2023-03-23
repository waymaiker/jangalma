import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationBarProvider = ChangeNotifierProvider(
  (ref) => NavigationBarController()
);

class NavigationBarController extends ChangeNotifier{
  int _selectedIndex = 0;

  NavigationBarController();

  void setIndex(int value){
     _selectedIndex = value;
     notifyListeners();
  }

  int get getIndex => _selectedIndex;
}