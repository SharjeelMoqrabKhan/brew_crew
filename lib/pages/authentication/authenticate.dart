import 'package:brew_crew/pages/authentication/register.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signingIn = true;
  void toggleView() {
    setState(() {
      signingIn = !signingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return signingIn
        ? SignIn(toggle: toggleView)
        : Register(toggle: toggleView);
  }
}
