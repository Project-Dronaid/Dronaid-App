import 'package:flutter/material.dart';
import 'package:project_dronaid/Screens/WelcomeScreen/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_dronaid/components/roundedButton.dart';
import 'package:project_dronaid/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(child:
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('WELCOME TO DRONAID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: size.height*0.04,),
          SvgPicture.asset('assets/icons/chat.svg',
          height: size.height*0.45,),
          SizedBox(height: size.height*0.05,),
          RoundedButton(
            text: 'LOGIN',
            textColor: Colors.white,
            route: 'login',
            color: kPrimaryColor,
          ),
          RoundedButton(
            route: 'signUp',
            text: 'SIGN UP',
            textColor: Colors.black,
            color: kPrimaryLightColor,
          ),
        ],
      ),
    ),);
  }
}



