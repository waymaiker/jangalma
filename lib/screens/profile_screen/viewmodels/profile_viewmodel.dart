import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/models/user_model.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel()
);

class ProfileViewModel extends ChangeNotifier {
  late UserModel user;
  late String photoURL;
  late String fullName;
  late String email;
  late String phone;
  late String pseudo;
  late String location;
  bool edit = false;

  ProfileViewModel();

  void init(UserModel userReceived){
    user = userReceived;
    fullName = userReceived.fullName;
    photoURL = userReceived.photoURL;
    email = userReceived.email;
    phone = userReceived.phone;
    pseudo = userReceived.pseudoTag;
    location = userReceived.location;
  }

  void saveProfile(){
    user.fullName = fullName;
    user.email = email;
    user.phone = phone;
    user.pseudoTag = pseudo;
    user.location = location;
    notifyListeners();
  }

  void setEdit(){
    edit = !edit;
    notifyListeners();
  }

  void setfullName(String fullNameReceived){
    fullName = fullNameReceived;
    notifyListeners();
  }

  void setEmail(String emailReceived){
    email = emailReceived;
    notifyListeners();
  }

  void setPhone(String phoneReceived){
    phone = phoneReceived;
    notifyListeners();
  }

  void setPseudoTag(String pseudoTagReceived){
    pseudo = pseudoTagReceived;
    notifyListeners();
  }

  void setLocation(String locationReceived){
    location = locationReceived;
    notifyListeners();
  }

  void resetForm(){
    edit = false;
    notifyListeners();
  }
}