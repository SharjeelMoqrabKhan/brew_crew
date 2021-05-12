import 'package:brew_crew/pages/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: Database().brews,
      child: Scaffold(
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
        body: BrewList(),
      ),
    );
  }
}
