import 'package:flutter/material.dart';

import '../SignUp//body.dart';

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
