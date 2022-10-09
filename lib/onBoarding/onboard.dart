import 'package:flutter/material.dart';
import '../onBoarding/onBoardingScreen.dart';


class OnBoard extends StatefulWidget {
  static const String id = 'Welcomeback';
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: OnBoardingScreen(),
    );
  }
}