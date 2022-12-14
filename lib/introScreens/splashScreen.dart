import 'dart:async' show Timer;
import 'package:dronaidapp/FirebaseService/SplashServices.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/onBoarding/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../onBoarding/onBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Color(0xff42AA8F),
              Color(0xff466FA7),
            ],
            stops: [0.35, 1],
          ),
          // image: DecorationImage(
          //     image: AssetImage('assets/images/Untitled design (5).png'),
          //     fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo here
                  SizedBox(
                    height: size.height * 0.7,
                    width: size.width * 0.7,
                    child: Image.asset(
                      'assets/images/spsc2.png',
                      height: 120,
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height*0.05,
                  // ),
                  const Text(
                    "One flight saves life.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SpinKitWave(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // const CircularProgressIndicator(
                  //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
