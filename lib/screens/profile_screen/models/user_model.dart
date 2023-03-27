
class UserModel {
  int id;
  String uid;
  String name;
  String image;
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
    required this.id,
    required this.name,
    required this.image,
    required this.pseudoTag,
    required this.email,
    required this.phone,
    required this.location,
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

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      location: map['location'] as String,
      pseudoTag: map['pseudoTag'] as String,
      emailVerified: map['emailVerified'] as bool,
      photoURL: map['photoURL'] as String,
      refreshToken: map['refreshToken'] as String,
      uid: map['uid'] as String,
      unlimitedSubscription: map['unlimitedSubscription'] as bool,
      groups: map['groups'] as List<dynamic>,
      creationTime: map['creationTime'] as String,
      lastSignInTime: map['lastSignInTime'] as String,
    );
  }
}