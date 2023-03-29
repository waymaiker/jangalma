
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jangalma/screens/profile_screen/models/user_model.dart';

final FirebaseFirestore _instance = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

FirebaseFirestore getFirebaseFirestoreInstance(){
  return _instance;
}

FirebaseAuth getFirebaseAuthInstance(){
  return _auth;
}

// UserID is actually his place/index into the collection
getUserID() async {
  try {
    final queryDocumentSnapshot = await getFirebaseFirestoreInstance().collection('users').get();
    return queryDocumentSnapshot.size;
  } catch (exception, stack) {
    print(exception.toString());
    print(stack.toString());
  }
}

createUserDB(UserModel user) async {
  try{
    await getFirebaseFirestoreInstance()
      .collection('users')
      .add(user.toJson());

  } catch (exception, stack) {
    print(exception.toString());
    print(stack.toString());
  }
}

createAccount(String emailAddress, String password, UserModel user) async {
  try {
    final userCredential = await getFirebaseAuthInstance().createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    user.setId(getUserID());
    user.setUID(userCredential.user!.uid);
    user.setCreationTime(userCredential.user!.metadata.creationTime.toString());
    user.setLastSignInTime(userCredential.user!.metadata.lastSignInTime.toString());

    createUserDB(user);

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

signIn(String emailAddress, String password) async {
  try {
    await getFirebaseAuthInstance().signInWithEmailAndPassword(
      email: emailAddress,
      password: password
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
