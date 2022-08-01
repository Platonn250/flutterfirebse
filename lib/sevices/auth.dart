// ignore_for_file: empty_catches, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecourse/models/user.dart';
import 'package:firecourse/screens/authenticate/authenticate.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  MyUser? _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user strem
  Stream<MyUser> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!)!);
  }

  //  sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signwiht email and pass

  //  sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
