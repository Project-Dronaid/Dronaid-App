import 'package:dronaidapp/Screens/Login/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const String id = 'Signup';
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
