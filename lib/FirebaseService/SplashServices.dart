import 'dart:async';
import 'package:dronaidapp/Screens/Home/homeScreen.dart';
import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../onBoarding/onboard.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    // This check if user is logged in or not
    final user = auth.currentUser;
    if (user!=null) {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => HomeScreen()),ModalRoute.withName('/')));
    } else {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => OnBoard()),ModalRoute.withName('/')));
    }
  }
}
