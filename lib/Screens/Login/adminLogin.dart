import 'package:dronaidapp/Screens/Login/adminBody.dart';
import 'package:flutter/material.dart';

import '../Login//body.dart';

class adminLogin extends StatelessWidget {
  static const String id = 'adminLogin';
  const adminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: adminBody(),
    );
  }
}
