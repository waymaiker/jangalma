import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jangalma/helpers/utils.dart';

final signupViewModelProvider = ChangeNotifierProvider(
  (ref) => SignupViewModel()
);

class SignupViewModel extends ChangeNotifier {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String confirmPassword;
  bool isConditionAccetped = false;
  bool formHasError = false;

  SignupViewModel();

  void init(){
    firstName = '';
    lastName = '';
    email = '';
    password = '';
    confirmPassword = '';
  }

  void setFirstName(String firstNameReceived){
    firstName = firstNameReceived;
    notifyListeners();
  }

  void setLastName(String lastNameReceived){
    lastName = lastNameReceived;
    notifyListeners();
  }

  void setEmail(String emailReceived){
    email = emailReceived;
    notifyListeners();
  }
  
  void setPassword(String passwordReceived){
    password = passwordReceived;
    notifyListeners();
  }
  
  void setConfirmPassword(String confirmPasswordReceived){
    confirmPassword = confirmPasswordReceived;
    notifyListeners();
  }

  void setConditions(){
    isConditionAccetped = !isConditionAccetped;
    notifyListeners();
  }

  void hasError(bool value){
    formHasError = value;
    notifyListeners();
  }

  bool isConfirmPasswordValid(){
    return password == confirmPassword ? true : false;
  }

  bool isFormValid(){
    return firstName.isNotEmpty
    && lastName.isNotEmpty
    && email.isNotEmpty
    && password.isNotEmpty
    && confirmPassword.isNotEmpty
    && validateString('First Name', firstName, hasError) == null
    && validateString('Last Name', lastName, hasError) == null
    && validateEmail(email, hasError) == null
    && validatePassword(password, hasError) == null
    && validatePassword(confirmPassword, hasError) == null
    && isConditionAccetped
    && !formHasError;
  }
}