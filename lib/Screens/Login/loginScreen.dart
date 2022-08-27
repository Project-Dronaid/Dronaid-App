import 'package:flutter/material.dart';

import '../Login//body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'Login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}
