import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
//import 'package:brew_crew/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key, this.toggle}) : super(key: key);
  final Function toggle;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew Crew Sign In'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        actions: [
          FlatButton.icon(
            onPressed: () {
              widget.toggle();
            },
            icon: Icon(
              Icons.toggle_on,
              color: Colors.white,
              size: 32.0,
            ),
            label: Text('Sign In'),
          )
        ],
      ),
      backgroundColor: Colors.brown[100],
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _keyForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) => value.length < 6
                      ? 'password shall be 6 chars long'
                      : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_keyForm.currentState.validate()) {
                      dynamic result =
                          await _auth.signInWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Couldn\t sign in with these credentials ';
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
