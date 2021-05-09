import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew'),
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text('Logout'),
          ),
        ],
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}
