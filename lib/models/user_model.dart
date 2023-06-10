import 'package:jangalma/services/user_firebase_api_service.dart';

class UserModel {
  int id;
  String uid;
  String fullName;
  String email;
  String phone;
  String photoURL;
  String location;
  String password;
  String pseudoTag;
  String refreshToken;

  List<dynamic> groups;
  String creationTime;
  String lastSignInTime;
  bool emailVerified;
  bool unlimitedSubscription;

  UserModel({
    required this.fullName,
    required this.pseudoTag,
    required this.email,
    this.id = -1,
    this.location = '',
    this.phone = '',
    this.uid = '',
    this.photoURL = '',
    this.password = '',
    this.creationTime = '',
    this.refreshToken = '',
    this.lastSignInTime = '',
    this.groups = const [],
    this.emailVerified = false,
    this.unlimitedSubscription = false,
  });

  Map<String, dynamic>toJson () {
    return {
      'id': id,
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'photoURL': photoURL,
      'location': location,
      'password': password,
      'pseudoTag': pseudoTag,
      'refreshToken': refreshToken,
      'groups': groups,
      'creationTime': creationTime,
      'lastSignInTime': lastSignInTime,
      'emailVerified': emailVerified,
      'unlimitedSubscription': unlimitedSubscription,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      location: map['location'] as String,
      pseudoTag: map['pseudoTag'] as String,
      emailVerified: map['emailVerified'] as bool,
      photoURL: map['photoURL'] as String,
      refreshToken: map['refreshToken'] as String,
      unlimitedSubscription: map['unlimitedSubscription'] as bool,
      groups: map['groups'] as List<dynamic>,
      creationTime: map['creationTime'] as String,
      lastSignInTime: map['lastSignInTime'] as String,
    );
  }

  void setId(int value) => id = value;
  void setUID(String value) => uid = value;
  void setFullName(String value) => fullName = value;
  void setPhone(String value) => phone = value;
  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;
  void setLocation(String value) => location = value;
  void setPseudoTag(String value) => pseudoTag = value;
  void setEmailVerified(bool value) => emailVerified = value;
  void setPhotoURL(String value) => photoURL = value;
  void setRefreshToken(String value) => refreshToken = value;
  void setUnlimitedSubscription(bool value) => unlimitedSubscription = value;
  void setGroups(String value) => groups.add(value);
  void setCreationTime(String value) => creationTime = value;
  void setLastSignInTime(String value) => lastSignInTime = value;

  createUserAccount(UserModel user) async {
    await createAccount(user.email, user.password, user);
  }
}