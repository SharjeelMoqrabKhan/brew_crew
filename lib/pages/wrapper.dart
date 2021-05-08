import 'package:brew_crew/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return either home or authenticate
    return Authenticate();
  }
}
