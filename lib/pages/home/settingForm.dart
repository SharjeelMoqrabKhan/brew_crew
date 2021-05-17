import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/widgets/inputDecoration.dart';
import 'package:brew_crew/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  //form values
  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: Database(uid: user.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Update your brew settings.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.name,
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      value: _currentSugar ?? userData.sugars,
                      onChanged: (val) {
                        setState(() {
                          _currentSugar = val;
                        });
                      },
                      items: sugars
                          .map(
                            (sugar) => DropdownMenuItem(
                              value: sugar,
                              child: Text('$sugar Sugars'),
                            ),
                          )
                          .toList(),
                    ),
                    Slider(
                        value:
                            (_currentStrength ?? userData.strength).toDouble(),
                        min: 100.0,
                        max: 900.0,
                        activeColor:
                            Colors.brown[_currentStrength ?? userData.strength],
                        inactiveColor:
                            Colors.brown[_currentStrength ?? userData.strength],
                        divisions: 8,
                        onChanged: (val) {
                          setState(() {
                            _currentStrength = val.round();
                          });
                        }),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          print(_currentName);
                          print(_currentSugar);
                          print(_currentStrength);
                        }),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
