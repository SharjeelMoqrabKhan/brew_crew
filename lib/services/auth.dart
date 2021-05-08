import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/model/user.dart';

class AuthService {
  //creating object of firebase auth class to use all methods
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creating custom user type
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  // signIn Anonymously
  Future singInAnonmously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Registration Emain and Password

  // signIn Emain and Password

  // sing out

}
