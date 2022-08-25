import 'package:flutter/material.dart';
import 'package:project_dronaid/Screens/WelcomeScreen/body.dart';


class WelcomeBack extends StatefulWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  @override
  Widget build(BuildContext context){
    return const Scaffold(
       body: Body(),
    );
  }
}