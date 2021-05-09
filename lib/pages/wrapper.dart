import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either home or authenticate
    return user == null ? Authenticate() : Home();
  }
}
