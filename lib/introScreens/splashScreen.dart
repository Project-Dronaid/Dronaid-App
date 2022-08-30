import 'dart:async' show Timer;
import 'package:dronaidapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../onBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff42AA8F),
              Color(0xff466FA7),

            ],
            stops: [0.35,1],
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
                    height: size.height*0.7,
                    width: size.width*0.7,
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
                    height: size.height*0.05,
                  ),
                  SpinKitWave(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: size.height*0.05,
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
