import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginViewModelProvider = ChangeNotifierProvider(
  (ref) => LoginViewModel()
);

class LoginViewModel extends ChangeNotifier {
  late String email;
  late String password;

  LoginViewModel();

  void init(){
    email = '';
    password = '';
  }

  void setEmail(String emailReceived){
    email = emailReceived;
    notifyListeners();
  }
  
  void setPassword(String passwordReceived){
    password = passwordReceived;
    notifyListeners();
  }
}