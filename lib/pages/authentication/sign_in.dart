import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew Crew'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      backgroundColor: Colors.brown[100],
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () async {
              dynamic result = await _auth.singInAnonmously();
              if (result == null) {
                print('error');
              } else {
                print('Sign In');
                print(result.uid);
              }
            },
            child: Text('Sign In Anon'),
          ),
        ),
      ),
    );
  }
}
