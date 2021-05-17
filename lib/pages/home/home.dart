import 'package:brew_crew/model/brew_model.dart';
import 'package:brew_crew/pages/home/brew_list.dart';
import 'package:brew_crew/pages/home/settingForm.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingPannel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingForm();
          });
    }

    return StreamProvider<List<Brew>>.value(
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
            FlatButton.icon(
              onPressed: () => _showSettingPannel(),
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
        backgroundColor: Colors.brown[50],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'), fit: BoxFit.cover),
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}
