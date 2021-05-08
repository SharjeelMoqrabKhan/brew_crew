import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  //creating object of firebase auth class to use all methods
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signIn Anonymously
  Future singInAnonmously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  
  // Registration Emain and Password

  // signIn Emain and Password

  // sing out

}
