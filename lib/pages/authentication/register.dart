import 'package:flutter/material.dart';
//import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.toggle}) : super(key: key);
  final Function toggle;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final AuthService _auth = AuthService();
  String email = '';
  String password = '';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
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
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
