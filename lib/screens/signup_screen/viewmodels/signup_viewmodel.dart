import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jangalma/helpers/utils.dart';
import 'package:jangalma/screens/profile_screen/models/user_model.dart';

final signupViewModelProvider = ChangeNotifierProvider(
  (ref) => SignupViewModel()
);

class SignupViewModel extends ChangeNotifier {
  late UserModel user;
  late String confirmPassword;
  bool isConditionAccetped = false;
  bool formHasError = false;

  SignupViewModel();

  void init(){
    user = UserModel(
      fullName: '',
      pseudoTag: '',
      email: ''
    );

    user.password = '';
    confirmPassword = '';
  }

  void setfullName(String fullNameReceived){
    user.fullName = fullNameReceived;
    notifyListeners();
  }

  void setPseudoTag(String pseudoTagReceived){
    user.pseudoTag = pseudoTagReceived;
    notifyListeners();
  }

  void setEmail(String emailReceived){
    user.email = emailReceived;
    notifyListeners();
  }

  void setPassword(String passwordReceived){
    user.password = passwordReceived;
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
    return user.password == confirmPassword ? true : false;
  }

  bool isFormValid(){
    return user.fullName.isNotEmpty
    && user.pseudoTag.isNotEmpty
    && user.email.isNotEmpty
    && user.password.isNotEmpty
    && confirmPassword.isNotEmpty
    && validateString('First Name', user.fullName, hasError) == null
    && validateString('Last Name', user.pseudoTag, hasError) == null
    && validateEmail(user.email, hasError) == null
    && validatePassword(user.password, hasError) == null
    && validatePassword(confirmPassword, hasError) == null
    && isConditionAccetped
    && !formHasError;
  }

  void createAccount() async {
   await user.createUserAccount(user);
  }
}