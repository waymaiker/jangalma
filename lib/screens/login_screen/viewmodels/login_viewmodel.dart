import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jangalma/helpers/utils.dart';

final loginViewModelProvider = ChangeNotifierProvider(
  (ref) => LoginViewModel()
);

class LoginViewModel extends ChangeNotifier {
  late String email;
  late String password;
  bool formHasError = false;

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

  void hasError(bool value){
    formHasError = value;
    notifyListeners();
  }

  bool isFormValid(){
    return email.isNotEmpty
    && password.isNotEmpty
    && validateEmail(email, hasError) == null
    && validatePassword(password, hasError) == null;
  }
}