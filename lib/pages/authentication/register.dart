import 'dart:ui';

import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
//import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.toggle}) : super(key: key);
  final Function toggle;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew Crew Register'),
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
            label: Text('Resgister'),
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
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_keyForm.currentState.validate()) {
                      dynamic result =
                          await _auth.registerWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please provide valid email and password';
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
