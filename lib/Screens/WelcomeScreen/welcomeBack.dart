import 'package:flutter/material.dart';
import '../WelcomeScreen/body.dart';


class WelcomeBack extends StatefulWidget {
  static const String id = 'Welcomeback';
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
       body: Body(),
    );
  }
}