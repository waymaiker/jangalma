import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jangalma/screens/profile_screen/models/user.dart';

final profileViewModelProvider = ChangeNotifierProvider(
  (ref) => ProfileViewModel()
);

class ProfileViewModel extends ChangeNotifier {
  late UserModel user;
  late String image;
  late String name;
  late String email;
  late String phone;
  late String pseudo;
  late String location;
  bool edit = false;

  ProfileViewModel();

  void init(UserModel userReceived){
    user = userReceived;
    name = userReceived.name;
    image = userReceived.image;
    email = userReceived.email;
    phone = userReceived.phone;
    pseudo = userReceived.pseudoTag;
    location = userReceived.location;
  }

  void saveProfile(){
    user.name = name;
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

  void setName(String nameReceived){
    name = nameReceived;
    print(name);
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
}